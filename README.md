# LeoFS3FS-C

S3FS-C is a FUSE (File System in User Space) based file system backed by Amazon S3 storage buckets. Once mounted, S3 can be used just like it was a local file system.

This Docker uses a Debian image and its installation and configuration  is describe in [leofs site]

You'll need 4 environment variables:
- AWSACCESSID
- AWSSECRETID
- BUCKET (bucket name you want to mount locally)
- URL (url to your own S3 in LeoFS, don't forget it must contain http://<url>:<port>)

#Example

```docker run -d --name leofs3 --device=/dev/fuse -e BUCKET=test -e AWSACCESSID=<your_aws_access_id> -e AWSSECRETID=<your_aws_secret> -e URL=http://<url>:<port> --privileged=true devopsbq/leos3fs-c```

[leofs site]: http://leo-project.net/leofs/docs/s3api_client/s3_client_s3fsc.html
