package modules

import (
	"fmt"

	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/acm"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

type AcmArgs struct {
	DomainName       pulumi.StringPtrInput
	ValidationMethod pulumi.StringInput
}

type Acm struct {
	pulumi.ResourceState
	Arn                 pulumi.StringOutput
	DomainName          pulumi.StringOutput
	ResourceRecordName  pulumi.StringOutput
	ResourceRecordType  pulumi.StringOutput
	ResourceRecordValue pulumi.StringOutput
}

func NewAcm(
	ctx *pulumi.Context,
	name string,
	args *AcmArgs,
	opts ...pulumi.ResourceOption,
) (*Acm, error) {
	var componentResource Acm
	err := ctx.RegisterComponentResource("components:index:Acm", name, &componentResource, opts...)
	if err != nil {
		return nil, err
	}
	cert, err := acm.NewCertificate(ctx, fmt.Sprintf("%s-cert", name), &acm.CertificateArgs{
		DomainName:       args.DomainName,
		ValidationMethod: args.ValidationMethod,
	}, pulumi.Parent(&componentResource))
	if err != nil {
		return nil, err
	}
	err = ctx.RegisterResourceOutputs(&componentResource, pulumi.Map{
		"arn":                 cert.Arn,
		"domainName":          cert.DomainName,
		"resourceRecordName":  cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordName(),
		"resourceRecordType":  cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordType(),
		"resourceRecordValue": cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordValue(),
	})
	if err != nil {
		return nil, err
	}
	componentResource.Arn = cert.Arn
	componentResource.DomainName = cert.DomainName
	componentResource.ResourceRecordName = pulumi.StringOutput(cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordName())
	componentResource.ResourceRecordType = pulumi.StringOutput(cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordType())
	componentResource.ResourceRecordValue = pulumi.StringOutput(cert.DomainValidationOptions.Index(pulumi.Int(0)).ResourceRecordValue())
	return &componentResource, nil
}
