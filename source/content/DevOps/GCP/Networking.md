---
title: "Networking"
date: 2020-06-14T09:29:44+01:00
---

### VPC Virtual Private Cloud

VPC is a set of GCP objects, such as:

- Project
    - Associated to services and networks
    - Organize infrastructure resources 
    - Link objects and services with billing
    - Contain networks, default up to 5
    - It containt entire networks

- Network: can be shared with other projects or peered, are global, and no ip address range
    - Default
        - Every project
        - one subnet per region
        - Default firewall rules
    - Auto
        - Default network
        - One subnet per region
        - Regional IP allocation
        - Fixed /20 subnet per region 
        - Expandable to /16
    - Custom
        - No default subnets created
        - Full control of IP ranges
        - Regional IP allocation
        - Expandable to any RFC 1918 size


    ![example of network isolation](/devops/gcp/vpcnetworkexample1.png)

    To connect to a on-premises network you can use a VPN gateway service from VPC. This is possible because VPC is global.
    ![VPC is global and connect to on-prem](/devops/gcp/vpcconnecttoonprem.png)
- Subnets
    - They work at REGIONAL scale.
    - VMs can be on same subnet but different zones
    - One single firewall rule can apply to both VMs
    - Every subnet has 4 reserved addresses: 
        - x.0.0.0   Network
        - x.0.0.1   Subnet gateway
        - x.0.0.255 Broadcast
        - x.0.0.254 Primary used by Google ( second-to-last address )
    - New subnets can not overlap with extisting subnets
    - New subnets address should be inside the [RFC 1918](https://tools.ietf.org/html/rfc1918) address spaces
    - Subnets can expand, can not shrink. Start with small subnet ranges
        - To expand a subnet: GCP console -> VPC Network -> Click subnet -> Click Edit -> Modify the range in "IP address range"
    - Automode can be expanded from /20 to /16
    - Avoid large subnets
    
    ![VPC subnets per zone](/devops/gcp/vpcsubnetszones.png)

- Regions
- Zones
- Ip addresses
    - Internal 
        - Allocated  from subnet range to VMs by DHCP
        - DHCP lease is renewed every 24 hours
        - VMs name + IP is registered with network scoeped DNS

    - External
        - Assigned from pool ( external ips are ephemeral by default )
        - Reserved (static) and billed more then not arrached to running VM
        - VM does not know external IP, it is mapped to internal

- VMs
- Routes
- Firewall rules







