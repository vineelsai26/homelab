package modules

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/cloudfront"
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func NewCloudfront(ctx *pulumi.Context, name string, domainNames pulumi.StringArrayInput, s3Bucket *s3.BucketV2, defaultLambdaAssociationArray cloudfront.DistributionDefaultCacheBehaviorLambdaFunctionAssociationArray, awsProvider *aws.Provider) (*cloudfront.Distribution, error) {
	cloudfrontAcm, err := NewAcm(ctx, name+"Acm", &AcmArgs{
		DomainName:       domainNames.ToStringArrayOutput().Index(pulumi.Int(0)),
		ValidationMethod: pulumi.String("DNS"),
	}, pulumi.Provider(awsProvider))
	if err != nil {
		return nil, err
	}

	cloudfrontOriginAccessControl, err := cloudfront.NewOriginAccessControl(ctx, "s3_access_control", &cloudfront.OriginAccessControlArgs{
		Name:                          pulumi.String("s3_access_control"),
		Description:                   pulumi.String("Access control for blog S3 bucket"),
		OriginAccessControlOriginType: pulumi.String("s3"),
		SigningBehavior:               pulumi.String("always"),
		SigningProtocol:               pulumi.String("sigv4"),
	})
	if err != nil {
		return nil, err
	}

	cloudfrontS3Distribution, err := cloudfront.NewDistribution(ctx, name+"_s3_distribution", &cloudfront.DistributionArgs{
		Origins: cloudfront.DistributionOriginArray{
			&cloudfront.DistributionOriginArgs{
				DomainName:            s3Bucket.BucketRegionalDomainName,
				OriginAccessControlId: cloudfrontOriginAccessControl.ID(),
				OriginId:              pulumi.String("S3Origin"),
			},
		},
		Enabled:       pulumi.Bool(true),
		IsIpv6Enabled: pulumi.Bool(true),
		Comment:       pulumi.String("Cloudfront Distribution for S3 bucket"),
		Aliases:       domainNames,
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
			TargetOriginId:             pulumi.String("S3Origin"),
			ViewerProtocolPolicy:       pulumi.String("redirect-to-https"),
			LambdaFunctionAssociations: defaultLambdaAssociationArray,
		},
		Restrictions: &cloudfront.DistributionRestrictionsArgs{
			GeoRestriction: &cloudfront.DistributionRestrictionsGeoRestrictionArgs{
				RestrictionType: pulumi.String("none"),
			},
		},
		Tags: pulumi.StringMap{
			"Environment": pulumi.String("Pulumi"),
		},
		ViewerCertificate: &cloudfront.DistributionViewerCertificateArgs{
			AcmCertificateArn:      cloudfrontAcm.Arn,
			MinimumProtocolVersion: pulumi.String("TLSv1.2_2019"),
			SslSupportMethod:       pulumi.String("sni-only"),
		},
	})
	if err != nil {
		return nil, err
	}

	ctx.Export("repoAcmResourceRecordName", cloudfrontAcm.ResourceRecordName)
	ctx.Export("repoAcmResourceRecordType", cloudfrontAcm.ResourceRecordType)
	ctx.Export("repoAcmResourceRecordValue", cloudfrontAcm.ResourceRecordValue)

	return cloudfrontS3Distribution, nil
}
