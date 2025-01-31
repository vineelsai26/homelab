package main

import (
	"fmt"

	"github.com/pulumi/pulumi-archive/sdk/go/archive"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/cloudfront"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/iam"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"

	"Prod/modules"
)

func dlViewerRequestLambda(ctx *pulumi.Context, awsProvider *aws.Provider) (*modules.Lambda, error) {
	dlViewerRequestLambda, err := archive.LookupFile(ctx, &archive.LookupFileArgs{
		Type:       "zip",
		SourceFile: pulumi.StringRef("lambda/dl-viewer-request/main.py"),
		OutputPath: "dl_viewer_request_lambda.zip",
	}, nil)
	if err != nil {
		return nil, err
	}

	lambdaAssumeRoleDoc, err := iam.GetPolicyDocument(ctx, &iam.GetPolicyDocumentArgs{
		Statements: []iam.GetPolicyDocumentStatement{
			{
				Effect: pulumi.StringRef("Allow"),
				Principals: []iam.GetPolicyDocumentStatementPrincipal{
					{
						Type: "Service",
						Identifiers: []string{
							"lambda.amazonaws.com",
							"edgelambda.amazonaws.com",
						},
					},
				},
				Actions: []string{
					"sts:AssumeRole",
				},
			},
		},
	}, nil)
	if err != nil {
		return nil, err
	}

	defaultIamForLambda, err := iam.NewRole(ctx, "default_iam_for_lambda", &iam.RoleArgs{
		Name:             pulumi.String("default_iam_for_lambda"),
		AssumeRolePolicy: pulumi.String(lambdaAssumeRoleDoc.Json),
	})
	if err != nil {
		return nil, err
	}

	dlViewerRequestLambdaComponent, err := modules.NewLambda(ctx, "dl_viewer_request_lambda", &modules.LambdaArgs{
		Filename:       "dl_viewer_request_lambda.zip",
		FunctionName:   pulumi.String("dl_viewer_request_lambda"),
		Handler:        pulumi.String("main.lambda_handler"),
		SourceCodeHash: pulumi.String(dlViewerRequestLambda.OutputBase64sha256),
		Runtime:        pulumi.String("python3.12"),
		Publish:        pulumi.Bool(true),
		Role:           defaultIamForLambda.Arn,
		Provider:       awsProvider,
	})
	if err != nil {
		return nil, err
	}

	lambdaRoleDoc, err := iam.GetPolicyDocument(ctx, &iam.GetPolicyDocumentArgs{
		Statements: []iam.GetPolicyDocumentStatement{
			{
				Effect: pulumi.StringRef("Allow"),
				Actions: []string{
					"logs:CreateLogGroup",
					"logs:CreateLogStream",
					"logs:PutLogEvents",
				},
				Resources: []string{
					"arn:aws:logs:*:*:*",
				},
			},
			{
				Effect: pulumi.StringRef("Allow"),
				Actions: []string{
					"s3:GetObject",
					"s3:ListObjects",
					"s3:ListBucket",
				},
				Resources: []string{
					"*",
				},
			},
		},
	}, nil)
	if err != nil {
		return nil, err
	}

	defaultPolicyForLambda, err := iam.NewPolicy(ctx, "default_policy_for_lambda", &iam.PolicyArgs{
		Name:        pulumi.String("lambda_default_policy"),
		Path:        pulumi.String("/"),
		Description: pulumi.String("Default IAM policy for lambda"),
		Policy:      pulumi.String(lambdaRoleDoc.Json),
	})
	if err != nil {
		return nil, err
	}

	_, err = iam.NewRolePolicyAttachment(ctx, "default_role_for_lambda", &iam.RolePolicyAttachmentArgs{
		Role:      defaultIamForLambda.Name,
		PolicyArn: defaultPolicyForLambda.Arn,
	})
	if err != nil {
		return nil, err
	}

	return dlViewerRequestLambdaComponent, nil
}

func repoWebsite(ctx *pulumi.Context) error {
	awsEast1, err := aws.NewProvider(ctx, "us-east-1", &aws.ProviderArgs{
		Region: pulumi.String("us-east-1"),
	})
	if err != nil {
		return err
	}

	dlViewerRequestLambdaComponent, err := dlViewerRequestLambda(ctx, awsEast1)
	if err != nil {
		return err
	}

	repoBucketV2, err := s3.NewBucketV2(ctx, "repo", &s3.BucketV2Args{
		Bucket: pulumi.String("repo.vineelsai.com"),
		Tags: pulumi.StringMap{
			"Name":        pulumi.String("S3 Bucket for repo"),
			"Environment": pulumi.String("Terraform"),
		},
	})
	if err != nil {
		return err
	}

	lambdaAssociationArray := cloudfront.DistributionDefaultCacheBehaviorLambdaFunctionAssociationArray{
		&cloudfront.DistributionDefaultCacheBehaviorLambdaFunctionAssociationArgs{
			EventType: pulumi.String("viewer-request"),
			LambdaArn: pulumi.StringOutput(dlViewerRequestLambdaComponent.QualifiedArn),
		},
	}

	domainNames := pulumi.StringArray{
		pulumi.String("repo.vineelsai.com"),
	}

	repoS3Distribution, err := modules.NewCloudfront(ctx, "repo", domainNames, repoBucketV2, lambdaAssociationArray, awsEast1)
	if err != nil {
		return err
	}

	ctx.Export("repoCloudfrontDistributionId", repoS3Distribution.ID())
	ctx.Export("repoCloudfrontDistributionArn", repoS3Distribution.Arn)
	ctx.Export("repoCloudfrontDistributionDomainName", repoS3Distribution.DomainName)

	readRepoBucket := iam.GetPolicyDocumentOutput(ctx, iam.GetPolicyDocumentOutputArgs{
		Statements: iam.GetPolicyDocumentStatementArray{
			&iam.GetPolicyDocumentStatementArgs{
				Actions: pulumi.StringArray{
					pulumi.String("s3:GetObject"),
				},
				Resources: pulumi.StringArray{
					repoBucketV2.Arn.ApplyT(func(arn string) (string, error) {
						return fmt.Sprintf("%v/*", arn), nil
					}).(pulumi.StringOutput),
				},
				Effect: pulumi.String("Allow"),
				Conditions: iam.GetPolicyDocumentStatementConditionArray{
					&iam.GetPolicyDocumentStatementConditionArgs{
						Test:     pulumi.String("StringEquals"),
						Variable: pulumi.String("AWS:SourceArn"),
						Values: pulumi.StringArray{
							repoS3Distribution.Arn,
						},
					},
				},
				Principals: iam.GetPolicyDocumentStatementPrincipalArray{
					&iam.GetPolicyDocumentStatementPrincipalArgs{
						Type: pulumi.String("Service"),
						Identifiers: pulumi.StringArray{
							pulumi.String("cloudfront.amazonaws.com"),
						},
					},
				},
			},
		},
	}, nil)

	_, err = s3.NewBucketPolicy(ctx, "repo", &s3.BucketPolicyArgs{
		Bucket: repoBucketV2.ID(),
		Policy: readRepoBucket.ApplyT(func(readRepoBucket iam.GetPolicyDocumentResult) (*string, error) {
			return &readRepoBucket.Json, nil
		}).(pulumi.StringPtrOutput),
	})
	if err != nil {
		return err
	}

	_, err = modules.NewLambdaPermission(ctx, "defaultCloudfrontLambda", &modules.LambdaPermissionArgs{
		StatementId:  pulumi.String("AllowExecutionFromCloudFront"),
		Action:       pulumi.String("lambda:InvokeFunction"),
		FunctionName: dlViewerRequestLambdaComponent.FunctionName,
		Principal:    pulumi.String("edgelambda.amazonaws.com"),
		Qualifier:    dlViewerRequestLambdaComponent.Version,
		SourceArn:    repoS3Distribution.Arn,
		Provider:     awsEast1,
	})
	if err != nil {
		return err
	}

	return nil
}

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		if err := repoWebsite(ctx); err != nil {
			return err
		}

		return nil
	})
}
