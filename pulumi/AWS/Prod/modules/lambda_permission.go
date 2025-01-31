package modules

import (
	"fmt"

	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/lambda"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

type LambdaPermissionArgs struct {
	StatementId  pulumi.StringInput
	Action       pulumi.StringInput
	FunctionName pulumi.StringInput
	Principal    pulumi.StringInput
	Qualifier    pulumi.StringInput
	SourceArn    pulumi.StringInput
	Provider     pulumi.ProviderResource
}

type LambdaPermission struct {
	pulumi.ResourceState
}

func NewLambdaPermission(
	ctx *pulumi.Context,
	name string,
	args *LambdaPermissionArgs,
	opts ...pulumi.ResourceOption,
) (*LambdaPermission, error) {
	var componentResource LambdaPermission
	err := ctx.RegisterComponentResource("components:index:LambdaPermission", name, &componentResource, opts...)
	if err != nil {
		return nil, err
	}

	_, err = lambda.NewPermission(ctx, fmt.Sprintf("%s-default_cloudfront_lambda", name), &lambda.PermissionArgs{
		StatementId: args.StatementId,
		Action:      args.Action,
		Function:    args.FunctionName,
		Principal:   args.Principal,
		Qualifier:   args.Qualifier,
		SourceArn:   args.SourceArn,
	}, pulumi.Parent(&componentResource), pulumi.Provider(args.Provider))
	if err != nil {
		return nil, err
	}

	err = ctx.RegisterResourceOutputs(&componentResource, pulumi.Map{})
	if err != nil {
		return nil, err
	}

	return &componentResource, nil
}
