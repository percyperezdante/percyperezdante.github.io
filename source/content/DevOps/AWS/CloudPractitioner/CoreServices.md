---
title: "CoreServices"
date: 2020-11-28T18:26:31Z
---

# Methods to interact to AWS

- AWS console
    - Includes Mobule app
    - Good for testing services or simple tests 

- AWS CLI
    - Includes: Java, .net, Node.js, JS, PHP, Python, Ruby, Go, C++
    - automation

- AWS SDK
    - automation
    - use it when you want to integreat to your app

### AWS console

- Two types of user: ROOT USRE and IAM user.
    - Root has unlimited permissions 
    - IAM has limited permission

- Multifactor authenticatoin
- User infromation:
    - My account
    - MY org
    - My services quota
    - My billing dahsboard
    - User infromation:
        - My account
        - MY org
        - My services quota
        - My billing dahsboar
        - Order and invoices
        - Security credentials  <=== Set password, and multifactor authentication, access keys
- AWS region:
    - you can select the one you need

- Services:
    - all service by category
    - Route 53 is set as "GLOBAL" for region

### AWS CLI

- Get a key: 
    - GO to my account -> Your security credentials -> Select Access keys ->  Create new access key
        - This will generate a:
            - Access key ID
            - Secret access key
    - **DO NOT** generate ROOT access key
    - How to use this credentials
        ```
        $ aws --version

        # To config credentials
        $ aws configure --profile myteste
            AWS access key ID: xxxxddd
            AWS secret access key; xxxxxx
            Default region: us-east-1
            Default output: json

        # Now you can execute aws commands
        $ aws s3 ls --profile myteste

        ```
# Computer services

- EC2
- Elastick beantalk
- Lambda

### EC2

- EC2 is a web service that provides resizable compute capacity in the cloud. It is designed to make web-scale computing easier for developer
- When to use:
    - Web server 
    - Batch processing
    - API server: web server
    - Desktop in the cloud

- Main concetps for EC2:
    - Instance types
        - Defines the processor, memory and storage type
        - Cannot change without downtime
        - There are different categories:
            - General purposes
            - Compute, memory and storage optimized
            - accelerated computing, e.g. Machine Learning, access to GPU
        - Prices are based on instance type
            - The more resources you use, the more you pay

        ![EC2 instance price](/devops/aws/cloudpractitioner/ec2instancepricetype.png?width=50pc)

        - Root device type
            - Two types: 
                - Instance store: **ephemeral** sotrage that is physically attached to the host the VM you are running on
                    - Data in Ephemeral instance just dessapear when you shutdown the EC2 instance
                - Elastic Block Store (EBS): **Persistent** storage that exists separately from the host the VM you are running on
                    - Data in persistance, so data will **NOT** dessapear when you shutdown the EC2 instance
            - Usually you may use EBS.

        - Amazon Machine Image AMI
            - Template for an EC2 instance including config, OS, and data
            - AMI can be shared across accounts
            - You can custom your AMI
            - There are  comercial AIM's available in the AWS marketplace

        - Purchase options/types
            - On demand
                - Pay by the second for the instance you lunched
                - If you have inconsistent need for instances that can not be stoped without affecting the job


            - Reserved
                - Purchase a discount instance in advance for 1-3 years
                - Use reserve instance if your instance requires to be consistent and always needed
            ![EC2 instance price](/devops/aws/cloudpractitioner/reservedcostmodel.png?width=50pc)
            ![Resernve pricing](/devops/aws/cloudpractitioner/reserveinstancepricingexample.png?width=50pc)



            - Spot
                - You can leaverage unused EC2 capacity in a region for a large discount
                - If you have batch processing when process can start/stop without affecting the job
            ![Spot instances](/devops/aws/cloudpractitioner/spotinstances.png?width=50pc)
            ![Spot pricing](/devops/aws/cloudpractitioner/spotinstancepricingexample.png?width=50pc)


# Launching EC2 instances

    - Go to console.aws.amazon.com and search for EC2
    - Select for "launch instance"
    - Select an image of your preference: AWS marketplace, community, your AMIs
    - Select instance type of your preference:
        - NOTE `12.micro is FREE tiere elegible`
    - Click on `Configure instance details` and you can select the paramteres you need
        - You can also `enable` the `auto asign public ip`
    - In the section `advance details-> user data`, you can copy the shell command to run in the new EC2 instance.
        - in the user data you can add shell comamnds such as:
            ```
                yum install httpd -y
                service httpd start
            ```
    - You can add a tag which is a {ID:value}
    - Configure the security group
        - For http you need to include SSH from your IP , and HTTP for everyone(0.0.0.0/0)

    - Review it and then launch it
    - YOu need to use a ssh key pair: public and private keys to ssh the EC2 instance


### to terminate EC2

    - Select the EC2 instance 
    - Click Actions and then select instance state and then terminate


# EBS Elastic Beanstalk

    - Support specific set of tech
            ![EBs general elastic beanstalk](/devops/aws/cloudpractitioner/ebsgeneral.png?width=50pc)
    - Feautures:
        - Monitoring
        - Deployment
        - Scaling
        - EC2 customization
    - When to use:
            ![EBs use case](/devops/aws/cloudpractitioner/ebsusecases.png?width=50pc)

# How to laucnh EBS

### To launch

    - Visit the developer page for EBS and select the correct package you want to use
    - Donwload the package
    - Go to EBS console
    - Click get started
    - Type application name
    - Choose the platform 
    - You can upload your code 
    - click Create App

### To delete ebs 
    - In the console
    - Click in Actions
    - Select : Termiante environment
    - Enter the name of the app
    - Hit terminate

# Lambda

> Lambda lets you run code without provisioning or manging servers. You pay only for the compute
time you consume. You can run code for virtually any type of app or backend service - all with  zero admin

In general the main feature of Lambda are:
        ![Lambda general](/devops/aws/cloudpractitioner/lambdageneral.png?width=50pc)

- Advantages:
    - Reduce maintenance requirements
    - Enables fault tolerance
    - Scales based on demand
    - Pricing is based on usage

# Scenarios

- Case 1: One workload will leaverage at least for 5 years. 
    - It could use a all upfront reserved - 3 years

- Case 2: Developer who does not know about infrastrcuture
    - Then EBS could be one option

- Case 3:  If any workload can be stop and start at anytime
    - The best option is SPOT, not reserved


---
# Virtual Private Cloud VPC

> VPC is a logically isolated section fothe AWS cloud where you can launch AWS resources in a virtual network that you define

- It is a virtual network that you define and you can configure
- Support IPV4, IPV6
- You can configure:
    - Ip address range
    - subnets
    - Route tables
    - Network gateway
- VPC support public and private subnets
- You can use NAT for private subnets
- Enables a connection to your data center
- You can connect VPC each other
- Support private connections to many AWS services


# AWS direct connect

> It is a cloud service solution that makes it easy to establicsk a dedicated network connection from yur data center to AWS.

# Route 53

- It is Domain Name Service
- It is global AWs service, not regional
- It is highly available
- Enables global resource routing
- Changes are not instantaneous, it requires a couple of hours to be propagated across the world

# Elastic load balancer

> Elasticity is the ability for the infrastcuture, supporting an app, to grow and contract based on how much it is used at a point in time

- Distribute traffic across multiple targets
- Integrates with EC2, ECS and Lambda
- Support one or more Avaialble Zones in a region
- Three types of load balancer:
    - Application load balancers ( ALB)
    - Network load balancers ( NLB)
    - Classic load balancers 

### Scaling on Amazon EC2

- Vertical scaling, scale up
    - You enhance your existing instance to a larger instance with additional resources such as more RAM, more CPUs
- Horizontal scaling, scale out
    - Add new instances to handle the demand of you application

# CloudFront
- It is a service that allows you CDN
- Your users get content from servers closer to them, which increase performance
- Support static and dynamic content
- It also utilizes the AWS edge location
- Includes security features:
    - AWS shield for DDoS
    - AWS WAF, Web application firewall


# Api gateway

- Fully managed API management service. You provide webservices that other app can call and you can distribute them through CLoudFront
- Provides monitoring and metrics on API calls
- Support integration with VPC and on-premise  private applications

# Scenarions

- Case 1: If you want your data center to work alongside AWS for specific workload.
    - Use Amazon direct connect
- Case 2: If you want to optimize performance around the world and leverage CDN?
    - Use Amazon Cloud front 



---

# File Storage Services

### Amazon S3

Main features
        ![S3](/devops/aws/cloudpractitioner/s3general.png?width=50pc)
        ![S3 non archival](/devops/aws/cloudpractitioner/s3nonarchival.png?width=50pc)

