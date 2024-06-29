### Objective:
Create an AWS infrastructure to host a static website using Terraform. The infrastructure will include AWS S3 for storing the website files, CloudFront for content delivery, and Route 53 for domain name management and SSL certificates.


## Prerequisites:
AWS Account
Domain name registered in Route 53

# Code Explainations
This project was executed with modules concept on terraform. 
A sub folders were created named "module_s3_bucket", "module_cloudfront", "module_Route53", "module_certificate" and within those folders, main.tf, variables.tf and output.tf files were created respectively. In the root folder, a main.tf, provider.tf, variable.tf files were also created.

# S3 Bucket. 

The Terraform code written in the main.tf file inside the "module_s3_bucket" folder and it creates and S3 Bucket, Configures it as a website with index and error document, blocks public access to the bucket and uploads objects into the bucket. 

first step is to run the s3 bucket creation module from the root main.tf

- The image below show the success/output on the terminal when you create the s3 bucket
  ![bucket creation from terminal](/terraform_assignment_images/bucket_creation_terminal.PNG)

To confirm if thr bucket was actually created, i checked in the console and got the image below

- The image below show the success/output on the terminal when you create the s3 bucket
  ![bucket created on console](/terraform_assignment_images/bucket_console.PNG)

# Cloudfront

The Terraform code written in the main.tf file inside the "module_cloudfront" folder and it creates and cloudfront distribution, Configures it with default cache behaviour, viewer certifcate is set to default for now, enable OAI, and configure a new bucket policy that gives cloud front access to the S3 bucket

Then we run the cloud front module. 

- The pictures below are image of the output after cloudfront is created on the terminal, confirmation on the console and the webpage of the s3 bucket it renders. 
  ![cloudfront creation on the terminal](/terraform_assignment_images/cloud_distro_creation.PNG)

  ![cloudfront creation on the console](/terraform_assignment_images/cloud_distro_console.PNG)
   
  ![cloudfront rendering the webpage](/terraform_assignment_images/cloudfront_page.PNG)

# Route53

Next step is to create the route53 which helps with our domain registration and our DNS routing 

- The pictures below shows the output on our terminal after running the route53 module and confirmation of it's creation on the console

  ![Route53 creation on Terminal](/terraform_assignment_images/route53_creation_terminal.PNG)

  ![Route53 creation on console](/terraform_assignment_images/route53_creation_console.PNG)

# SSL Certificate
Next thing is to run our certicate module to create SSL certifacte which helps with encryption, Authentication, Data integrity and compliance. 

- The output of the SSL creation are shown below both on the terminal and the console

  ![SSL certificate creation on terminal](/terraform_assignment_images/certificate_creation_terminal.PNG)

  ![SSL certificate creation on console](/terraform_assignment_images/certificate_creation_console.PNG)


Next step is to update the viewer certificate resource on our cloudfront main.tf code to the values of the SSL certificate that was created so the domain name can be linked to the cloud front. 

- The output below shows both on the terminal and the console that the cloudfront was linked successfully

  ![SSL and cloudfront link confirmation success](/terraform_assignment_images/completion_terminal.PNG)

  ![SSL and cloudfront link confirmation on console](/terraform_assignment_images/completion_console.PNG)