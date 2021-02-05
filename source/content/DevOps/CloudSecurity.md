---
title: "CloudSecurity"
date: 2021-02-02T18:40:42Z
---

# Introduction to coud security

## Cloud deployment methods

### Software delivery mechanism

- SaaS: Hands-off approach, where all hardware, software and security controls are managed by the provider, e.g. email.
- PaaS: Where you place your own source code on the top of the provider's infrastructure or platform, e.g. Heroku.
- IaaS: Where you build your own infrastrucuture and deploy your code on the top. 

Challenges and barriers when you move to the cloud include:

- Compliance and regulation of cloud providers.
- Application security.
- Identity and access management (IAM), which features include:
    - Unified interface for administration of policies and rulesets
    - MFA, password policies and logging
    - RBAC at granular level
    - Programatic controls to manage IAM policies and updates applied through automated tools
    - Single Sign-on (SSO) integration with providers
    - Custom workflow creation and centralized audits capabilities
    - Separation of duties, helps on auditing

Below some of the best practices:
    - Always craete individual users, never share credentials
    - Do not use root user for normal operation, remove any access key for root
    - Use groups to assign permissions to IAM users, not to individuals
    - Enable logging for all cloud API calls
    - Audit IAM accounts in regular bases
    - Restrict access to cloud resources using ip addresses
    - Turno on billing alerts to detect suspicious events
    - Requets to users to use multi-factor authentatication, including command lines interfaces
    - Assign users and groups to have emough access permissions

Most of the cloud providers offer a Virtual Private Cloud (VPC) whic his a representation of a physical network or data center. It is used for communication between resources within a project. It also isolates resources from outside world.

In VPC, every resource receives an individual IP address. This includes:
    - Traffic to and from instances inside the VPC are controlled with firewall rules
    - Resources inside VPC communicate each other using IP addresses
    - Instances within VPC can communicate witht eh cloud providers APIs and services


To protect communication:
    - Virtual Private Networks (VPN):  Offers encrypted traffic between two networks over public networks such as internet.
    - Web traffic Encryption: It is important to use TLS encruptio from cloud load balancers to any VMs or containers in the backend.

Note that inmutable infrastructure in here means, that instances on the cloud are replaced rather than updated: destroy-versus-updatei


### Data security

To ensure object storage security:
    - Access control: 
        - Grant permissions to all object requires access only
        - Do not make data public if it is not needed
        - Double check with your provider to ensure proper configuration
        - Use third-party audit tools to ensure no leaks
    - Logging:
    - Data retention:
        - Cloud providers have the ability to set user-defined retention policy
        - An object can be deleted once its age is greater than the retentino policy set

### Persistent disks
    - Backup disks periodically
    - Compress and store them in a location of your choice

### Containers

    - To enforce the principle of least privilege, create an user with known ID int he dockerfile and run the application process as that user
    - Verify the integrity of an docker image using its SHA256
    - Scan vulnerabilities on your docker images using command line tools such as Clair or Anchore in your CI/CD pipeline

### Serveless security

    - Scan your code base with static or dynamic analysis tools
    - Ensure third party libraries are free of vulnerabilities
    - Threat model regularly
    - Construct a robust loggin pipeline
    - Apply the least privilege principle in your functions
    - Protect your code from DoS and Resrouce-exhaustion attacks
    - Consider the following resources:
        - [OWASP ServerlessGoat](https://www.owasp.org/index.php/OWASP_Serverless_Goat)
        - [OWASP Serverless Top 10](https://www.owasp.org/index.php/OWASP_Serverless_Top_10_Project)

### Monitoring

    - App Metrics:
        - Who logged in, from where , when
        - Get attack payload submitted in the request
        - HTTP error codes
        - Response times
        - Vulnerability scanner detection

    - Host metrics:
        - Resource utilization, CPU, memory, threads
        - SSH access
        - Port opened, closed
        - Malware detection
        - File creation / deletion
        - Thrid party libraries installed

    - Network metrics:
        - Throughput
        - Resource exhaustion
        - Outbound network calls
        - DNS queries

    - Cloud API metrics:
        - Who logged into 
    
    - AWS cloud trail:
        - Console sign-in events
        - Security group changes
        - CloudTrail logging changes
        - VPC changes

### Analysis

Here some overall indicatores:
    - Number of 500 erros per period of time on your backend
    - If number of loggin attemps with same user 
    - Attemps to access another account

Note that logs should offer high integrity and not able to be deleted or modified easly.

# GCP

### Introduction

Some recommendations:

- The GCP cloud platform itself is PCI DSS compliant. This does not mean that a company building an application in GCP is also in compliance with PCI DSS. Note that GCP is responsible for the compliance and security of the cloud infrastructure, and the company using GCP is responsible for the data and applications built on top of the platform.
- Isolate development and production environments and restrict developer access to sensitive production data.
- Analyse application using static or dynamic scanning tools

### Key concepts

- Location:
    - Glabal: When a resource is accessed across regions and zones, such as disk snapshots, networks, firewalls, images
    - Regional: Resource that can only be accessed by other resource in the same region. It includes static external IP addresses, subnets and regional persistent disks
    - Zonal: Resource hosted in a specific zone, such as CMs, disks.

- Services:
    - GCP services provides access to the resources.

- Client libraries:
    - App APIs provide access to services
    - Admin APIs provide funtionality for resource management.

- To consider about DoS attacks
    - Use GCP virtual networks to isolate your resources from internet
    - Use firewall to limit access
    - Reduce number of public IP addresses you deploy
    - In the evento of a DoS use autoscaling to absorv the load and stay online
    - Use CDN to offload traffic
    - Consider Cloud Armor for defense
- Compliance:
    - GCP is a PCI DSS certified cloud service provider and provides documentation 
    - If you are storing cardholder data in an GCP environment, you are responsible for managing your own PCI DSS compliance certification.
    - PCI compliance is not inherited from GCP. A qualified PCI auditor must inspect your architecture to ensure it complies with the standard.

### IAM

- General features
    - Unified interface for IAM administration
    - Offers multi-factor authentication, password policies and logging
    - RBAC to usres and services at granular level
    - Programiatic controls
    - Single Sign On capabilities
    - Custom workflow creation and centralized audit

- Google cloud identity and access management features:
    - SSO: single sign on
    - Pre configured and custom roles
    - Built in audit trail
    - Access through CLI, web interface and SDKs
    - iIntegration to directory services such as Google Cloud Identity

- Google cloud identity features:
    - SSO support using SAML2.0 and OpenID connect
    - Device managemente policy enforcement for a variety of device types, Android and iOS
    - MFA 
    _ Application catalog creation of thrird-party SaaS apps.
    - Ability to integrate other cloud directoires as well as on-premise directoreis into Google Cloud Identity
- Configuration :
    - Roles: It is a collection of permissions assigned to a user, group or service account. This includes:
        - Primitive roles:
            - Viewer: Read-only 
            - Editor: All permissions to edit
            - Owner: All permssions and acttions such as:
                - Managing roles and permissions for a project and resources
                - Setting up billing
        - Predefined roles 
            - More granular access than primitives
            - E.g. Storage object Creator role: to create buckets, but can not delete or overwrite them 
        - Custom roles.
            - Enforce the principle of least privilege: access only to what you need or is enough
            - 
    - Policies:
        - It is a list of members bound to roles
        - A policy defines who has what kind of access
    - Service account:
        - For non-human access
        - Generally uses hard code tokens to prove identity
            - GCP managed keys: Used by Cloud platform services ( App Engine), not downloadable and two week rotation
            - User-managed keys: Created, downloaded and managed by users. Valid for 10 years.

- IAM best practices:
    - Organize IAM policies simliar to your company structure, each team responsable for its own app and services
    - Grant roles to a group, not to a individual
    - Grant roles with atomic scope needed
    - Use labels to annotate, group and filter resources
    - Audir regularly
    - Enforce MFA
    - Customize password complexity policy and SSO
    - When possible set predefined roles or custom roles over primitive roles
    - Restrict which users can create or modify services accounts
    - Becareful when granting the owner role
    - Rotate service account keys
    - Label service account keys to decrease confusion
    - Do not push service account keys to code repositories
    - Minimize access to GCP audit logs for each user themselves, e.g. do not allow to delete logs
    - Backup logs 

### Network and data security

- VPC
    - General:
        - Traffic to and from instances withtin a VPC are controlled by firewalls rules
        - Resources within a VPC are able to communciate each other using internal IP address
        - Instances inside VPC are able to communicate with official Google APIs
    - Subnets:
        - VPC consist of a range of internal IP addresses partitioned into subnets
        - VPC are global resources, subnets are regional. A VPC can containt multiple subnets in different regions
        - Internal  IP address are contained in a Subnet, not VPC. You need at least one subnet in a VPC before use it.
    - Networking peering
        - Allos for private connectivity across two VPC networks regarless of whether the VPC is in the same org or project
    - Access using IAM
        - Create or modify VPC is for admins only
    - Flow logs
        - To capture sample network flow traffic sent to and from a resource within a VPC subnet
        - E.g. Stackdriver Logging
        - Capture period is five secons internvals for TCP and UDP
    - Firewall:
        - Each VPC has own firewall for control traffic out of the VPC and between VMs inside VPC
        - Default policy: deny-all
    - Data Storage:
        - Apply RBAC:
            - Enforce fine grained access control using IAM permissions
            - Do not make bucket public
            - Enable logging
            - Data retention :
                - User-defined data retentino policy for new or existing buckets
                - Locked data, which can never be removed, or after certain time
                - Persistent disk: supports custom-supplied encryption keys, this should be backed up periodically.
                - Google cloud SQL: It is a database-as-a-service that supports MYSQL and PostgreSQL.
    - Encrypting data in transit:
        - Cloud VPN:
            - GCP offers a VPN to connect your VPC to on-premises or other clouds infrastructures
            - Encrypt traffic as it travels
            - IDeal to secure low-volume data connections
        - Cloud Interconnect
            - For higher bandwidth and encrypted connections
            - It is a way to extend your on-prem network to Google's network
            - Cloud VPN can not be used over Cloud Interconnect, you need to create a VPN gateway
            - Using CLoud Load Balancing you can terminet TLS at the load balancer. This needs to set certs and keys on each VM with in VPC to ensure end-to-end encryption

