### S3-Website

This module provisions an S3 bucket configured for website hosting, enabling static website hosting features.

#### Variables

- **bucket_name**: Required. Specifies the globally unique name for the S3 bucket.
- **env**: Required. Indicates the deployment environment for the bucket.
- **allowed_headers**: _Optional_. Defines headers allowed in the CORS configuration. Defaults to ["*"].
- **allowed_methods**: _Optional_. Specifies request methods permitted in the CORS configuration. Defaults to ["GET", "PUT", "POST"].
- **allowed_origins**: _Optional_. Lists origins allowed to access the bucket in the CORS configuration. Defaults to ["*"].
- **expose_headers**: _Optional_. Identifies headers that browsers can access as part of the CORS configuration. Defaults to ["ETag"].
- **max_age**: _Optional_. Sets the duration (in seconds) the browser should cache the CORS preflight response. Defaults to 3000.
- **index**: _Optional_. Defines the index document for the website. Defaults to "index.html".
- **error**: _Optional_. Specifies the error document for the website. Defaults to "error.html".

#### Outputs

- **bucket_arn**: Outputs the Amazon Resource Name (ARN) of the created bucket.
