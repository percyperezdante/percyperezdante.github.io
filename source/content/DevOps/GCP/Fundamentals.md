---
title: "Fundamentals"
date: 2020-04-12T11:06:46+01:00
---

### Introduction

GCP offers four main services:

    - Compute
    - Storage
    - Big data
    - Machine learning

The fundamentals course covers mainly the first two plus networking.

Cloud computing is an on-demand infrastrucuture available under the following characteristics:

    - Compute resouces on-demand self-service: no human intervention
    - Access from anywhere in the internet
    - Resource pooling: GCP provides share-base resources
    - Rapid elasiticity: Get more resources quickly as needed
    - Measured service: pay for what you consume or use

There are serveral GCP computing services, such as:

    - IaaS: where you pay for what you allocated
    - PaaS: where you pay for what you use

GCP allocation:

    - Zone: Deploymenat area, not geographically related. A zone is a single failure domain witdh in a region.
    - Region: Group of zone, independen geographical areas. 

### The basics

To work in GCP you organise your work load in projects. These projects organize GCP resorues with common basic objectives. Access to GCP is through IAM, GCP ID and Access Management, and it defifnes who can do what.

User interfaces to access and interact with GCP includes: 

    - Web interface ( GCP console and generally used at the begining )
    - SDK ( gcloud, gsutil for cloud storage, bq for Big query )
    - Command line ( cloud shell )
    - RESTful API ( uses JSON and OAuth 2.0 authentication and authorization )
    - Mobile App  

All resources in GCP are organised into projects.Optionally, this projects can be organised into folder and subfolders. All these projects, folders and subfolders that belongs to an organisation can be brought under an organisation node. Each project  is separated compartiment and usually have the following id:

    - Project ID:  Global inmutable unique name chosen by you.
    - Project name: Can be mutable and chosen by you.
    - Project number: Global inmutable number given by GCP.

On the other hand, a policy is set on a resource, where each policy contains a set of roles and role members. Resources inherit policies from parents, where a less restrictive policy overrides a more restrictive resource policy. For example, if a organisation node policy is set to read only, but a project policy is set to read and write, then read and write is possible for that project. Take in mind this when you design your policies.

The Identity and Access Management, IAM, helps to manage access rights to currents users of a project. There are three parts:

    - Who: Identifies the user or resource, such as google or service account, group, domain. 
    - How/when: This uses AIM Role, a collection of permissions: primitive, predefined, and custom. 
        - Primitive are broad an include: owner, editor , viewer and billing administrator. 
        - Predefined: Pre designed rules that can be used.
        - Custom: Where you design and set your own roles.
    - What: GCP Resource.

Note to give access permissions to a VM you need to use a service account. 

GCP Launcher is a quick tool for deployment that contains a pre-packaged and ready-to-deploy solutions. Some of these solutions are offered by Google and others by third-party vendors.  GCP upgrades on the VMs do not update installed packages, but GCP allows you to maintain them.

### Virtual Private Cloud (VCP) network

VCP is a set of one or many virtual machines interconnected through a virtual network inside your project in GCP. It is similar to a traditional network where you can define your own firewall rules to restrict access to internal resources or create static routes to redirect traffic to specific destination. An important feature of VCP in GCP is its global scope, which allow your virtual machines to be reachable globaly. It is possible to allocate resources in different zones or expand resources, such as storage or network, to any virtual machine inside your VCP. One tip at this stage is to use preemptible VMs which allows you in some extend to reduce costs.

A VM can be creatd by console UI or by command line, gcloud. If there is not a pre-define image of your interest, you can customise your own image. Additionally, in cases such as intensive data analysis, you can use a local SSD disk. However, you need to store the data of permanent value in different place as GCP will not leave data on your local SSD disk after all process has finished. For this last case, you can use GCP persistent disks.

At booting time, you can als provide to GCP start-up scripts or metadata to initialise your VM. It is possible to define the number of CPUs and memory size for each VM, for example, at the time of this writing, the maximum number of CPU to provision was 96, and the maximum memory size in data was 624 GB.  To complete tasks such as intensive data analytics, GCP offers auto-scale, which automatically deploys new VMs base on the load of your task. Additionally, GCP offers cloud load balancing base on the incoming traffic. The options that GCP offer for cross regional load balancing are:

    - Global HTTP(s): Layer 7 load balancing based on load. It routes different URLs to different backends.
    - Global SSL proxy: Layer 4 load balancing for non-HTTPS SSL traffic.
    - Global TCP proxy: Layer 4 load balancing of non-SSL TCP traffic.
    - Regional: Load balancing of any traffic, TCP and UDP on any port.
    - Regional internal: Load balancing of traffic inside a VPC. All options have this option.
    
Inside a VCP, GCP already set up a firewall and routers, you do not need to provision these resources manually. However, you can configurate them as you need. This feature comes automatically because VCP networks belong to GCP projects. In case you need to allow communication between two VCP from different GCP project, you can use VCP peering.  Additonally, you can difine access rules between VCPs using VCP sharing, which define who and what can be accessed from one VCP to another.

On the other hand, GCP offers also Cloud DNS, which can be manage programatically through its API or by command line. You can manage zones, which includes edit, add, remove DNS entries. Finally, Cloud CDN is able to cache your content close to your clients.

Note that in the case you want to interconnect with external networks or your own local network, GCP offers the following options:

    - VPN: Through a cloud router using Boarder Gateway protocol.  This means you access your GCP through internet.
    - Direct peering: This is private connection between your network and GCP. This is not cover GCP SLA. 
    - Carried peering: Connection through the largest partner network of service providers.
    - Dedicated Interconnect: Connects nx10G transport circuit for private cloud traffic.

**How to create a VM using UI console**

```toml
    1. Login to GCP console --> Click product and services --> Compute Engine --> VM instances --> create.
    2. Edit name, zone, VM specs as you need --> Click create.
```

**How to create a VM by command line**

```toml
    1. Click on Activate Google Cloud shell ( icon on the top bar ) 
    2. $gcloud compute zones list   # List all available zones
    3. $gcloud config set compute/zone us-central1-c   # Sets the zone 
    4. $gcloud compute instances create "MYVM" \
        --machine-type "n1-standard-1" \
        --image-project "debian-cloud" \
        --image "debian-9-stretch-v20170918" \
        --subnet "default"
```

**Basic inspection**

```toml
    - You can ssh into your VM by click on the SSH in the console interface.
    - You can ssh from one VM to another by ssh <NAME_VM> directly. 
    - You can install a web server, such as nginx-light, and use http to retrieve content.
    - Use sudo to have admin privileges without a password.
```

### Storage

You can store data inside the VMs you ship in GCP. However, GCP can store structured, unstructured, transactional and relational data throught the following services:

```toml
    - Cloud storage
    - CLoud SQL
    - Cloud Spanner
    - Cloud Data Store
    - Google Big Table
```

**Cloud storage**
Cloud storage uses object storages to store your data. Object storage is not same as the traditional file storage or block storage. Instead, the whole object is stored by associating it to a key, a key that has a URL form.

Cloud storage is a set of buckets, that are inmutable, which means that you can not edit them, but you can create a new version of them. Cloud storage always encrypt your data in the server side.

Each bucket has a unique id and location. You can move one bucket from one location to another in order to optimise latency. To control access to your buckets you can use Cloud IAM, which in general is sufficient. Each of the access control lists, ACLs, have two parts: one to specify the user or group of users and the other to specify the type of permissions associated to these users or groups.

Additionaly, you can turn on versioninng, which allows you track all modifcations of you object storage. However, if you turn off your versioning, you will always have one version of your object storage, which means that the old version will be replaced by the new one.

GCP offers four Cloud storage classes:

```toml
    - Regional(99.95% availability): Let your store your data in a specific region. Cheaper but less redundant. Examples include: Europe west, asia east.
    - Multi-regional(99.90% availability): Stores your date in a at least two geographica regions separated by at lease 160 km. Examples include: EU, Asia. Ideal for data frequently accessed.
    - Nearline(99.00% availability): It is a low cost and ideal for unfrequently accessed data, such as once a month or lest on average.
    - Coldline(99.00% availability): It is a very low cost and ideal for data accessed less than once a year, such as archiving, online backups and disaster recovery.
```


There are several methods to transfer your data into Cloud storage. These methods include gs-util, drag and drop, online transfer storage service and the offline transfer appicanes tools. Cloud Storage also works with other GCP services to transfer your data, these services include import export tables using BigQuery and cloud SQL, Object storage, logs and backups from App engines, scripts and images from Compute Engine.

**Google Big Table**

It is a NOSQL Big Data database service. Bigtable can scale to billonw of rows and thousands of columns allowing you to store petabytes of data. It is ideal for storing large set of data with low latency, it support high throughput to both read and write, which make it a good choice for operational and analytical analysis.

It uses the same open source API as HBase. The advantages of using Bigtable over Hbase are:

```toml
    - Scalability: especially when query rates per time increases, GCP manages to scale up your cluster through a machine counter. 
    - Administration: These tasks are transparent to the user, and GCP manages all operational work such as updates, and patches.
    - Encryption: Data is encrypted in both in-flight and at rest. Also IAM permissions can be applied to RBAC to Bigtable data.
    - GCP: Bigtable is same data base used by Google's core services such as search, analytics and maps.
```

Bigtable can be accessed by the following patterns:

```toml
    - App API: You can write and read from Bigtable using service layer like VMs, HBase REST server or Java server through HBase client. 
    - Streaming: You can use popular tools such as Cloud Dataflow, Spark Streaming and Storm.
    - Batches: You can read and write using Hadoop Mapreduce, Dataflow, or Spark.

```


**CLoud SQL**

**Cloud Spanner**

**Cloud Data Store**


