package main

import (
	"github.com/pulumi/pulumi-aws/sdk/v6/go/aws/s3"
	"github.com/pulumi/pulumi/sdk/v3/go/pulumi"
)

func main() {
	pulumi.Run(func(ctx *pulumi.Context) error {
		_, err := s3.NewBucketV2(ctx, "github_backup", &s3.BucketV2Args{
			Bucket: pulumi.String("vineelsai-github-backup"),
			Tags: pulumi.StringMap{
				"Name":        pulumi.String("S3 Bucket for GitHub Backup"),
				"Environment": pulumi.String("Terraform"),
			},
		})
		if err != nil {
			return err
		}
		_, err = s3.NewBucketV2(ctx, "truenas_backup", &s3.BucketV2Args{
			Bucket: pulumi.String("vineelsai-truenas-backup"),
			Tags: pulumi.StringMap{
				"Name":        pulumi.String("S3 Bucket for TrueNAS Backup"),
				"Environment": pulumi.String("Terraform"),
			},
		})
		if err != nil {
			return err
		}
		_, err = s3.NewBucketV2(ctx, "vineelsai_backup", &s3.BucketV2Args{
			Bucket: pulumi.String("vineelsai-backup"),
			Tags: pulumi.StringMap{
				"Name":        pulumi.String("S3 Bucket for General Backup"),
				"Environment": pulumi.String("Terraform"),
			},
		})
		if err != nil {
			return err
		}
		// cfg := config.New(ctx, "")
		// The AWS Region in which to create the S3 bucket.
		// awsRegion := "ap-south-1"
		// if param := cfg.Get("awsRegion"); param != "" {
		// 	awsRegion = param
		// }
		// The AWS access key to use.
		// awsAccessKey := cfg.RequireObject("awsAccessKey")
		// // The AWS secret key to use.
		// awsSecretKey := cfg.RequireObject("awsSecretKey")
		return nil
	})
}
