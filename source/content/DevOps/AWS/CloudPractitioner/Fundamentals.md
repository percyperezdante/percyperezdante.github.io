---
title: "Fundamentals"
date: 2020-11-28T10:13:49Z
---

# Main topics:

- Creating an account
- Examining traditional data center challenges:

    - Large up-front investment
    - Difficult to predict future traffic or demand
    - Slow deploy of new data centers and servers
    - Maintain data centers is expensive
    - You own all security and compliance burden with all data centers


- Benefits of cloud computing

    - Trade capital expense for variable expenses: you pay what you use
    - Scaling
    - Stop to guess future needed capacity, traffic
    - Speed and agility
    - Stop spend money for maintenance
    - Go global in minutes. Deploy new data centers in any part of the world
    - Elasticity
    - Realibility: failover,
    - Agility: 
        - Low cost of trying new business ideas
        - Reduces time to maintain infrastructure
        - Reduces risk for orgs aroud security and compliance
        - Provides access to emerging techs



- What is cloud computing:

> It is the on-demand delivery of compute power, database storage, applications, and other IT resources through a cloud services platform via the internet with pat-as-you-go pricing.

- Types of clouds
    - Iaas you can full/maximun control of your infra
    - SaaS you provide a software as a service, you do not worry about infra
    - PaaS: Provide a plataform where you put your code and run it.

- Cloud deployment models:
    - Public cloud: such as AWS(pay as you go), GCP
    - On-Premises: Private cloud in a private data center
    - Hybrid: Use public and on-prem clouds

# AWS Global infrastrucute

Three types of infra:

## Regions
- It is a specific gographic region
- Each region has a CLUSTER of data center
- AWS has 22 launched regions

## Availability Zones

- It is one or more data centers
- One region has Multiple avalability zones
- Minimun: one reqion has minimun two availability zones
- Each availability zone has at least ONE data center
- Therefore, one region has at least two data centers
- Each availability zone is located within the geographical area of the AWS region
- Availability zones have redundant power, netowrking, and connectivity.
- Globaly, there are 69 availability zones

 What is availability:

> Extent to whcih an application is fulfiling its intended business purpose. Applications that are highly-available are built in a manner where a single failure wont lessen the application's ability to be fully operational


The first one is availability base on business needs. The second case is 100% availability, high availability


#### Naming syntax

For example: us-east-2b
Where:
    - us = area
    - east = sub-area
    - 2 = Nubmer that identifies the region in that area
    - b = availabitlity zone

From here:
    - the REGION NAME = us-east-2
    - The availability zone = us-east-2b

![AWS regions table](/devops/aws/cloudpractitioner/awsregionstable.png?width=50pc)

## Edge locations

- Part of a global content delivery network CDN
- These support only TWO services:
    - Amazon CLoudFront: which is AWS CDN
    - Amazon Route 53: which is AWS DNS service
    - There are more than 200 different location with edge locations
    - It is the most predominant and common infra in AWS
    - Edge locations server content from location that are closer to users

### In practice

- The AWs global infra : https://infrastructure.aws/
- IN this link edge location = points of presence
- If we need to store or service in multiple geographical areas/regions, then AWS region is needed
- If the need is to optimize access to user content around the world, then AWS edge loction is needed.

- If the need is to ensure availability, then AWS availability zones is needed.


# Economics 

### Difference between data center and cloud

> Capitalized Expenditure (capEx): When building a data center, an organizatio invests in upfront costs for the building , servers, and supporting equipment. This type of expense to attain a fixed asset is referred to as a Capitalized Expenditure or CapEx

> Operating Expenditure( OPEX): The regular day to day expenses of a business are considered Operating Expenditure or  OpEx. After the initial build of a data center, ongiong connectivity, utility, and maintencance costs would be considered OpEx.

- The problem with data centers is that at the beginning there is a "unused capacity " and just before increasing the capacity, there is a "demand over capacity" that forces to increase the size of the data centere.  
- During the "deman over capacity" many users can not use our service because our infrastrcuture capacite reach its limits.

![Data center capacity](/devops/aws/cloudpractitioner/handlingcapacitydatacenter.png?width=50pc)
![Cloudl capacity](/devops/aws/cloudpractitioner/cloudcapacity.png?width=50pc)
![Costs data center](/devops/aws/cloudpractitioner/costsbuildingdatacenter.png?width=50pc)
![Data center capacity](/devops/aws/cloudpractitioner/datacentercloudcomparison.png?width=50pc)

### Costs in AWS

- Use the "AWS cost explorer " tool, an interface for:
    - Provides breakdown per service and cost tag
    - Provides prediction for next three months of costs
    - GIve recommendation for cost optimization
    - Get access via API

- "AWS budgets": Utilizes data from AWS cost explorer to plan and track your usage across AWS services. It can track cost per serbice , serbice usage, reserved instance utilzization, and coverage, and Saving Pans utilizion and coverage.

- AWS TCO calculator:  Estimates what could be saved by using cloud.

- AWS Simply Monthly calculator: Estaimtes costs of running specific AWS infra.

- AWS resource tags:
    - Tags are metadata attached to specific AWS resources. For example: webserver tag include all webservers.
    - Common uses cases include department, env, or project.
    - Tag include a name and a valur
    - Costa allocation reports: includes costs grouped by tags
    - You can use tags in the AWS explorer

- AWS organization:
    - Allows you to manage many account under one master acount
    - It provides a consolidate billing for those account in the organization.
    - Enables organizations to centralize logging and security standards across accounts. 

### AWS TCO calculator

- TCO = Total cost ownership
- Compares running your workload in the data center versus in AWS
- WIth TCO you can:
    - Estamate costs for a org to move to the cloud
    - Download a summary report

- Location:  awstcocalculator.com


### AWS Simple Monthly Calculator

- Estimates the cost of running your workload in AWS, with no comparison
- Link: calculator.s3.amazonaws.com


### Cost explorer

- Login to "console.aws.amazon.com" -> Click in your name -> click " My billing dashboard". Then Click on "cost explorer" and then "Launch cost explorer"

- The cost explorer initially shows: current month cost and forecasted month end cost.

- To get more details in the dashboard, click "Explore costs"
- You can download CSV file

### Scenarios

- Case 1: company with many departments. Finance is asking to hav a separate costs between departments. Currently all resources are included within a single AWS account. 
    - IN this case we can use TAGS. Create a tag per department.

- Case 2: Company think to move to the cloud, but they want to know if this will save them money:  
    - The solution is use TCO calculator and provide the report to the stakeholders

- Case 3: Company is trying to know saving costs if they move a web service to the cloud.
    - Use Simple MOnthly calculator

# Suport AWS infra

- Supporting tools: 
    - AWS suuport
        - Enables support for AWS resources for workloags running in the cloud
        - Provided in different tiers based on need and scope
        - Include tools to provide automated answers and recommendations
    - AWS personal health dashboard
        > Provides alerts and remediation guidance when AWS is experiencing evnts that may impact you. For example,when there will be a outage in your region.

    - AWS tursted advisor
        - Check your AWS usage against best practices
        - Accessed from AWS console
        - Different checks are provided base on the AWS support plan tier
        - All AWS customer get access to seven core checks, which include:
            - Cost Optimization
            - Performance
            - Security
            - Fault tolerance
            - Service Limits

### AWS Support plan tiers differences:

Main four plans difference includes:

- Communication method
- Response time
- Cost
- Type of guidance offered


Main plans:

- Basic support:
    - To all customers
    - Access to trusted advisor ( 7 core checks)
    - 24x7 accesss to customer service: docs, forum, and white papers. No engineers
    - Access to AWS personal health dashboard
    - No monthly cost

- Developer support:
    - Include all from the basic support
    - Email access support engineers for business
    - Limited to 1 primary contact
    - Start at $29 per month, but tied to AWS usage


- Business support:
    - Include all from developer support
    - Full set of Trusted Advisor checks
    - 24x7 phone, email and chat access support engineers
    - Unlimited contacts
    - PRovided thrid party software support
    - Starts at $100 per month, tied to AWS usage

- Enterprise support:
    - Includes all from business support
    - Dedicate technical account manager
    - Include a concierge support team
    - start from 15000$ per month, tied to AWS usage

There is a importat part called  SUPPORT RESPONSE TIME


![Support resopnse time](/devops/aws/cloudpractitioner/supportresponsetime.png?width=50pc)

In here we have the following categories:

General guidance =  General question to be answer
System impaired = when somethng is not working as it should
Production system impaired = Production system that is not performing at its desired capacity.
Production system down = Production system that is completely un-functinal
Business-critical system down = Core system for an organization that is completly non functional


### Trusted advisor tool

![Trusted advisor tool](/devops/aws/cloudpractitioner/trustedadvisorboard.png?width=50pc)

- LInk: consoel.aws.amazon.com
    - Review recommendations
    - Type "trsuted advisor" in "find SERvices2

### Personal health dashboard

![Persona health board](/devops/aws/cloudpractitioner/personalhealthboard.png?width=50pc)


### Infra support scenarios

- case 1: One workload is cirtical and requirest 24 hours call support a day.
    - The most effective criteria is Business support
- case 2: The company needs to be able to call , text and email support if an issue occurs. Also needs response from support within 15 minutes.
    - Here applies:  Enterprise support
- Case 3: a developer does not need technical support, and he has access to trusted advisor core checks. 
    - Here Basic support is enough


# Review


![to review](/devops/aws/cloudpractitioner/toreview.png?width=50pc)
