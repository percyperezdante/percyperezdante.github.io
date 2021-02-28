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
        - VMs only see the internal IP, not the external.
        - The external IP is maped to the VM by VCP, but the OS of the VM does not know it.
        

    - External
        - Assigned from pool ( external ips are ephemeral by default )
        - Reserved (static) and billed more then not arrached to running VM
        - VM does not know external IP, it is mapped to internal
        - Admins can also publish public DNS records pointing to the instance
            - Public DNS records are not published automatically
        - DNS zone can be hosted using Cloud DNS

    - IP alias:
        - Primary subnet: defines the subnet
        - Each VM gets its primary IP from this range
        - Swcondary ranges provide an organizational tool
        - The following files replace the _spf.google.com TXT records previously recommended to use for listing Google IP addresses.
            - https://www.gstatic.com/ipranges/cloud.json:
                    Provides a JSON representation of Cloud IP addresses organized by region.
            - https://www.gstatic.com/ipranges/cloud_geofeed 
                    It is a standard geofeed formatted IP geolocation file that we share with 3rd-party IP geo providers like Maxmind, Neustar, and IP2Location.
            - https://www.gstatic.com/ipranges/goog.json and https://www.gstatic.com/ipranges/goog.txt are TXT and JSON formatted files respectively that include Google public prefixes in CIDR notation.

            - For more information as well as an example of how to use this information, refer to https://cloud.google.com/vpc/docs/configure-private-google-access#ip-addr-defaults

- VMs
    - Name resolution is handle by an internal DNS
    - Each VM has a hostname that can be resolve to an internal AP address.
        - FQDN= hostname.c.ProjectID.internal
- Routes
    - A route is create when a network or subnet is created.
    - COnnections are allowed or denied at the instance level
    - Firewall rules are stateful, it means birectional communication
    - If firewall and rules are deleted, the deny all ingress and allow all egress are still aplied.
- Firewall rules
    - Configure firewall by setting the following:
        - Direction: 
            - Inbound connections are matched with "ingress" rules only
            - Outbound connection sre matched with "egress" rules only
        - Source or destination:
            - For ingress: source = ip address, source tags or source service account
            - For egress: destination = rule with one or more ranges of ip addresses.
        - Protocol, port
        - Action: allow or deny
        - Priority: Order on how rules are applied, first matching rule is applied.
        - Rule assignment: All rules are assigned to all instances, but you can assign ceratin rules to especific instances only
    - Hierarchical firewall policies:
        - GCP uses "go to_next" to allow low level instances to evaluate the ingress/egress
- Example:
    - Go to GCP console -> click on VPC Networks
    - In the left pane, click Firewall rules. Notice that there are 4 Ingress firewall rules for the default network:
        - default-allow-icmp => This allows you to ping from a VM to the external IP only.
        - default-allow-rdp
        - default-allow-ssh ==> This allows you to ssh this VM. If you remove this and you wanted to ssh, you will see the following message:
            > Please consider adding a firewall rule to allow ingress from the Cloud IAP for TCP forwarding netblock to the SSH port of your machine to start using Cloud IAP for TCP forwarding for better performance.  Learn more Dismiss
            
        - default-allow-internal ==> This allows you to ping between VMs in the same subnet. The default-allow-internal firewall rule allows traffic on all protocols/ports within the default network. 
        - These firewall rules allow ICMP, RDP, and SSH ingress traffic from anywhere (0.0.0.0/0) and all TCP, UDP, and ICMP traffic within the network (10.128.0.0/9). The Targets, Filters, Protocols/ports, and Action columns explain these rules

    - Note that if a VM has not network set, GCP does not allow to create it. You need to create a VPC network first, and that name should appear during the creation of the VM under the " Management, security, disks, networking, sole tenancy " tag. 
    - To create a VPC network, you can choose auto mode with firewall rules:
        - Click on VPC network, create VPC, Name it
        - For subnet creation mode, click "automatic": Auto mode networks create subnets in each region automatically.
        - For Firewall rules, select all available rules. These are the same standard firewall rules that the default network had. The deny-all-ingress and allow-all-egress rules are also displayed, but you cannot check or uncheck them because they are implied. These two rules have a lower Priority (higher integers indicate lower priorities) so that the allow ICMP, internal, RDP and SSH rules are considered first.
        - Click create.
        - When VPC network is created note that a subnet was creatd for each region.
        - NOTE If you ever delete the default network, you can quickly re-create it by creating an auto mode network as you just did.

### Mutlple network interfaces:

- VPC network is isolated by default:
    - Communication inside VPC, though internal IP
    - Communication across networks, using external IP
- In multiple interfaces each NIC is attached to a different VPC network
    - Usually 8 NICs are allowed peer VM
        - VM <= 2vCPU, you can have 2 NICs
        - VM >  2 vCPI, you can have 1 NIC per vCPU ( max 8)
    ![Multiple interfacds](/devops/gcp/vpcmultipleinterfaces.png)
- Excercise:

- Command lines for network and subnets

    ```bash
    To create a VPC netwok with custom subnets
    $ gcloud compute networks create myvpcnet --project=myproject --subnet-mode=custom --mtu=1460 --bgp-routing-mode=regional
    To create subnet
    $ gcloud compute networks subnets create mysubnet --project=myproject --range=10.130.0.0/20 --network=myvpcnet --region=us-central1

    To create mynet network. another approach
    $ gcloud compute networks create mynet --subnet-mode=custom
    To create a subnet called subnet1
    $ gcloud compute networks subnets create subnet1 --network=mynet --region=us-central1 --range=172.16.0.0/24

    To list available VPC networks
    $ gcloud compute networks list

    NAME           SUBNET_MODE  BGP_ROUTING_MODE  IPV4_RANGE  GATEWAY_IPV4
    default        AUTO         REGIONAL
    mynet1         CUSTOM       REGIONAL
    mynet2         AUTO         REGIONAL
    privatenet     CUSTOM       REGIONAL
    
    To list subnets
    $ gcloud compute networks subnets list
    ```
    - NOTE: Instances on this network will not be reachable until firewall rules are created. As an example, you can allow all internal traffic between instances as well as SSH, RDP, and ICMP by running.
        ```bash
        $ gcloud compute firewall-rules create <FIREWALL_NAME> --network privatenet --allow tcp,udp,icmp --source-ranges <IP_RANGE>
        $ gcloud compute firewall-rules create <FIREWALL_NAME> --network privatenet --allow tcp:22,tcp:3389,icmp
        ```
    - default and mynetwork are auto mode networks and create subnets in each region automatically.
    - mynet1 and mynet2 are custom mode networks and start with no subnets, which gives you full control over subnet creation.
    - To list available subnets. Note that auto mode networks create default subnets,and custom mode create only manually created subnets 
    ```bash
    $ gcloud compute networks subnets list --sort-by=NETWORK
    ```

- Command line for firewall rules:
    ```bash
    $ gcloud compute firewall-rules create mynet-allow-icmp-ssh-rdp --direction=INGRESS --priority=1000 --network=mynet --action=ALLOW --rules=icmp,tcp:22,tcp:3389 --source-ranges=0.0.0.0/0
    
    To list all available firewall rules
    $ gcloud compute firewall-rules list --sort-by=NETWORK
    ```
- Command line to create VM:
   ```bash
    $ gcloud compute instances create myvm --zone=us-central1-c --machine-type=n1-standard-1 --subnet=privatesubnet-us

    To list all VMs
    $ gcloud compute instances list --sort-by=ZONE

    gcloud beta compute --project=be7ad6aa15 instances create managementnet-us-vm --zone=us-central1-c --machine-type=n1-standard-1 --subnet=managementsubnet-us --network-tier=PREMIUM --maintenance-policy=MIGRATE --service-account=310583-compute@developer.gserviceaccount.com --scopes=https://www.googleapis.com/auth/devstorage.read_only,https://www.googleapis.com/auth/logging.write,https://www.googleapis.com/auth/monitoring.write,https://www.googleapis.com/auth/servicecontrol,https://www.googleapis.com/auth/service.management.readonly,https://www.googleapis.com/auth/trace.append --image=debian-10-buster-v20210122 --image-project=debian-cloud --boot-disk-size=10GB --boot-disk-type=pd-balanced --boot-disk-device-name=managementnet-us-vm --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --reservation-affinity=any
   ```
    - NOte that two VMs in the same VPC can ping each other, but not necessarily other VPCs. To confirm this need to check the firewall rules. VPC networks are by default isolated private networking domains. However, no internal IP address communication is allowed between networks, unless you set up mechanisms such as VPC peering or VPN.
    - The number of interfaces allowed in an instance is dependent on the instance's machine type and the number of vCPUs. The n1-standard-4 allows up to 4 network interfaces. Refer [here](https://cloud.google.com/vpc/docs/create-use-multiple-interfaces#max-interfaces) for more information.

## Cloud identity and Access management

-  IAM is a service to identify "who","can do what", and "in which resource".
    - WHO: The members
        - Google accounts: Any individual that interacts with GCP, e.g. developer
        - Service accounts: Account that belongs to an application
        - Google groups: Collection of google accounts and service accounts. It has unique email addresses linked to each group. Ideal to apply policy to a group of users.
        - G suite domains: Represents your organizational domain, e.g. example.com
        - Cloud identity: Collection of accounts in your organization, but they do not have access to similar services as G suite domain.
    - CAN WHO WHAT: Roles
        - Basic roles:
            - Owner
            - Editor
            - Viewer
            - Billing Administrator

    ![Cloud IAM](/devops/gcp/iamsrosourcehierarchy.png)

- A policy contains a set of roles and memebers
- Parent policies overrides a children policy, for example if the parent policy is less restrictive, it will override a more restrictive policy.

## Firewall

- VPC network functions as a distributed firewall
- Firewalls are applied to the network as a whole
- Deny all ingress and allow all egress rules are implied
- Firewall rules parameters:
    - Target: which could be one of the following: ( where to apply a rule )
        - All instances in the network
        - Specified target tags
        - Specified services accounts
    - Source: ( the type of resource to apply the rule)
        - IP ranges
        - Subnets
        - Source tags
        - Source accounts

- Default 

#### Exercise

- In this exercise we create a A and B nginx webserver in a default VPC network.
- Network tags are used by networks to identify which VM instances are subject to certain firewall rules and network routes. In a VM, you create a firewall rule to allow HTTP access for VM instances with the web-server tag. Alternatively, and during the creation of a VM using the GUI, you could select the Allow HTTP traffic checkbox, which would tag this instance as http-server and create the tagged firewall rule for tcp:80 for you.
- To create a firewall, remember that a firewall is linked to a network tag. Network tags are used in each VM, so if a rule applies to a tag, then this firewall rule will apply to all VMs that are pointing to this network tag.
    - In the GUI, go to VPC network -> firewall
    - Select the create a firewall rule:
        - GIve a name:
        - Network = default
        - Targets = Specified target tags
        - Source filter = IP ranges
        - Source IP ranges = 0.0.0.0/0
        - Protocol and ports = Specified protocols and ports
            - tcp =80

- Cloud IAM lets you authorize who can take action on specific resources, which give you full control and visibility to manage cloud resources centrally. The following roles are used in conjunction with single-project networking to independently control administrative access to each VPC network:
    - Network Admin: Permissions to create, modify, and delete networking resources, except for firewall rules and SSL certificates. Like read only.
    - Security Admin: Permissions to create, modify, and delete firewall rules and SSL certificates.

    - Explore these roles by applying them to a service account, which is a special Google account that belongs to your VM instance instead of to an individual end user. You will authorize a vm to use the service account to demonstrate the permissions of the Network Admin and Security Admin roles, instead of creating a new user.
    - Some suggested steps:
        - SSH to the Vm you want to apply permissions, and you will find that the Compute Engine default service account does not have the right permissions to allow you to list or delete firewall rules. The same applies to other users who do not have the right roles. This is why it is need to create a "service account"
          ```bash
          $ gcloud compute firewall-rules list 
          $ gcloud compute firewall-rules delete allow-http-web-server
          ```
        - To create a service account: 
            - IAM & admin console -> service accounts
            - Set the servie account name and click create
            - For Select a role, select Compute Engine > Compute Network Admin.
            - CLick continue and then done
            - Once this is complete, stop the VM, and edit the VM config and select "Network admin" ( or the name of your service account you just created ) in the field "service account"
            - Once you start your VM, you can ssh and try to run the last two gcloud commands and see if you do not have any error for "list" firewall rules. Note that "NEtwork adrmin oonly allows you read access"
            - To change settings from "Network admin" to "security admin":
                 - AIM & admin console
                 - CLick on AIM -> Search for the service account and click in the pencil for editing
                 - Select Compute Enginte and Compute Security Admin  insated of "Compute Network admin"

## Shared VPC

- Organization admin:
    - Organization is the root node
    - Workplace or cloude indentiy super administrators assign Oranization Admins
    - Nominates Shared VPC Admin ( compute.xpnAdmin)
- Shared VPC admin
    - Enables shared VPC host project
    - Attaches service projects
    - Delegates access to some or all subnets in shared VPC networkd ( compute.networkUser)
    - Shared VPC admin is the project owner  for a given host project
- Service Project Admin
    - Control over service project resources:
        - Compute instance admin
        - Project owner
    - Create resources in sahred VPC:
        - VM instances
        - Instance templates and groups
        - Static internal IP
        - Load balancers

        ![shared vpc example](/devops/gcp/sharedvpcexample.png)
        [Youtube Video on provisioning shared vpc](https://www.youtube.com/watch?v=4MtfyViH9t0)

        [Google docs for provisining shared VPC](https://cloud.google.com/vpc/docs/provisioning-shared-vpc)

