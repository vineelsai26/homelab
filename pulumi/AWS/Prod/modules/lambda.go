package modules

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/lambda"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

type LambdaArgs struct {
	Filename       string
	FunctionName   pulumi.StringInput
	Handler        pulumi.StringInput
	Runtime        pulumi.StringInput
	Publish        pulumi.BoolInput
	SourceCodeHash pulumi.StringInput
	Role           pulumi.StringInput
	Provider       pulumi.ProviderResource
}

type Lambda struct {
	pulumi.ResourceState
	Arn          pulumi.StringOutput
	QualifiedArn pulumi.StringOutput
	FunctionName pulumi.StringOutput
	Version      pulumi.StringOutput
}

func NewLambda(
	ctx *pulumi.Context,
	name string,
	args *LambdaArgs,
	opts ...pulumi.ResourceOption,
) (*Lambda, error) {
	var componentResource Lambda
	err := ctx.RegisterComponentResource("components:index:Lambda", name, &componentResource, opts...)
	if err != nil {
		return nil, err
	}

	lambda, err := lambda.NewFunction(ctx, name, &lambda.FunctionArgs{
		Code:           pulumi.NewFileArchive(args.Filename),
		Name:           args.FunctionName,
		Handler:        args.Handler,
		SourceCodeHash: args.SourceCodeHash,
		Role:           args.Role,
		Runtime:        args.Runtime,
		Publish:        args.Publish,
		Tags: pulumi.StringMap{
			"Environment": pulumi.String("Terraform"),
		},
	}, pulumi.Parent(&componentResource), pulumi.Provider(args.Provider))
	if err != nil {
		return nil, err
	}

	err = ctx.RegisterResourceOutputs(&componentResource, pulumi.Map{
		"arn":          lambda.Arn,
		"qualifiedArn": lambda.QualifiedArn,
		"functionName": lambda.Name,
		"version":      lambda.Version,
	})
	if err != nil {
		return nil, err
	}

	componentResource.Arn = lambda.Arn
	componentResource.QualifiedArn = lambda.QualifiedArn
	componentResource.FunctionName = lambda.Name
	componentResource.Version = lambda.Version
	return &componentResource, nil
}
