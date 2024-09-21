package main

import (
	"fmt"

	"github.com/pulumi/pulumi-archive/sdk/go/archive"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/cloudfront"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/iam"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		repoAcm, err := NewAcm(ctx, "repoAcm", &AcmArgs{
			DomainName:       pulumi.String("repo.vineelsai.com"),
			ValidationMethod: pulumi.String("DNS"),
		})
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
		repo, err := cloudfront.NewOriginAccessControl(ctx, "repo", &cloudfront.OriginAccessControlArgs{
			Name:                          pulumi.String("repo_access_control"),
			Description:                   pulumi.String("Access control for blog S3 bucket"),
			OriginAccessControlOriginType: pulumi.String("s3"),
			SigningBehavior:               pulumi.String("always"),
			SigningProtocol:               pulumi.String("sigv4"),
		})
		if err != nil {
			return err
		}
		s3OriginId := "S3Origin"
		dlViewerRequestLambda, err := archive.LookupFile(ctx, &archive.LookupFileArgs{
			Type:       "zip",
			SourceFile: pulumi.StringRef("lambda/dl-viewer-request/main.py"),
			OutputPath: "dl_viewer_request_lambda.zip",
		}, nil)
		if err != nil {
			return err
		}
		// ##############################################################################
		// Default Lambda IAM Role and Policy                                          #
		// ##############################################################################
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
			return err
		}
		defaultIamForLambda, err := iam.NewRole(ctx, "default_iam_for_lambda", &iam.RoleArgs{
			Name:             pulumi.String("default_iam_for_lambda"),
			AssumeRolePolicy: pulumi.String(lambdaAssumeRoleDoc.Json),
		})
		if err != nil {
			return err
		}
		awsEast1, err := aws.NewProvider(ctx, "us-east-1", &aws.ProviderArgs{
			Region: pulumi.String("us-east-1"),
		})
		if err != nil {
			return err
		}
		dlViewerRequestLambdaComponent, err := NewLambda(ctx, "dl_viewer_request_lambda", &LambdaArgs{
			Filename:       "dl_viewer_request_lambda.zip",
			FunctionName:   pulumi.String("dl_viewer_request_lambda"),
			Handler:        pulumi.String("main.lambda_handler"),
			SourceCodeHash: pulumi.String(dlViewerRequestLambda.OutputBase64sha256),
			Runtime:        pulumi.String("python3.12"),
			Publish:        pulumi.Bool(true),
			Role:           defaultIamForLambda.Arn,
			Provider:       awsEast1,
		})
		if err != nil {
			return err
		}
		repoS3Distribution, err := cloudfront.NewDistribution(ctx, "repo_s3_distribution", &cloudfront.DistributionArgs{
			Origins: cloudfront.DistributionOriginArray{
				&cloudfront.DistributionOriginArgs{
					DomainName:            repoBucketV2.BucketRegionalDomainName,
					OriginAccessControlId: repo.ID(),
					OriginId:              pulumi.String(s3OriginId),
				},
			},
			Enabled:       pulumi.Bool(true),
			IsIpv6Enabled: pulumi.Bool(true),
			Comment:       pulumi.String("Repo Distribution"),
			Aliases: pulumi.StringArray{
				pulumi.String("repo.vineelsai.com"),
			},
			DefaultCacheBehavior: &cloudfront.DistributionDefaultCacheBehaviorArgs{
				CachePolicyId: pulumi.String("658327ea-f89d-4fab-a63d-7e88639e58f6"),
				CachedMethods: pulumi.StringArray{
					pulumi.String("GET"),
					pulumi.String("HEAD"),
				},
				AllowedMethods: pulumi.StringArray{
					pulumi.String("GET"),
					pulumi.String("HEAD"),
					pulumi.String("OPTIONS"),
				},
				TargetOriginId:       pulumi.String(s3OriginId),
				ViewerProtocolPolicy: pulumi.String("redirect-to-https"),
				LambdaFunctionAssociations: cloudfront.DistributionDefaultCacheBehaviorLambdaFunctionAssociationArray{
					&cloudfront.DistributionDefaultCacheBehaviorLambdaFunctionAssociationArgs{
						EventType: pulumi.String("viewer-request"),
						LambdaArn: pulumi.StringOutput(dlViewerRequestLambdaComponent.QualifiedArn),
					},
				},
			},
			Restrictions: &cloudfront.DistributionRestrictionsArgs{
				GeoRestriction: &cloudfront.DistributionRestrictionsGeoRestrictionArgs{
					RestrictionType: pulumi.String("none"),
				},
			},
			Tags: pulumi.StringMap{
				"Environment": pulumi.String("Terraform"),
			},
			ViewerCertificate: &cloudfront.DistributionViewerCertificateArgs{
				AcmCertificateArn:      pulumi.String("arn:aws:acm:us-east-1:176796084758:certificate/87d3d721-6ba0-4336-b985-666851241399"),
				MinimumProtocolVersion: pulumi.String("TLSv1.2_2019"),
				SslSupportMethod:       pulumi.String("sni-only"),
			},
		})
		if err != nil {
			return err
		}
		_, err = NewLambdaPermission(ctx, "defaultCloudfrontLambda", &LambdaPermissionArgs{
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
		ctx.Export("repoCloudfrontDistributionId", repoS3Distribution.ID())
		ctx.Export("repoCloudfrontDistributionArn", repoS3Distribution.Arn)
		ctx.Export("repoCloudfrontDistributionDomainName", repoS3Distribution.DomainName)
		ctx.Export("repoAcmResourceRecordName", repoAcm.ResourceRecordName)
		ctx.Export("repoAcmResourceRecordType", repoAcm.ResourceRecordType)
		ctx.Export("repoAcmResourceRecordValue", repoAcm.ResourceRecordValue)
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
			return err
		}
		defaultPolicyForLambda, err := iam.NewPolicy(ctx, "default_policy_for_lambda", &iam.PolicyArgs{
			Name:        pulumi.String("lambda_default_policy"),
			Path:        pulumi.String("/"),
			Description: pulumi.String("Default IAM policy for lambda"),
			Policy:      pulumi.String(lambdaRoleDoc.Json),
		})
		if err != nil {
			return err
		}
		_, err = iam.NewRolePolicyAttachment(ctx, "default_role_for_lambda", &iam.RolePolicyAttachmentArgs{
			Role:      defaultIamForLambda.Name,
			PolicyArn: defaultPolicyForLambda.Arn,
		})
		if err != nil {
			return err
		}
		return nil
	})
}
