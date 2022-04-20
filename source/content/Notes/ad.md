---
title: "Ad"
date: 2022-04-20T05:55:42+01:00
---

#### General

- The Active Directory logical structure contains two types of objects. Objects can be either container objects or leaf objects. Container objects can be associated with other objects in the logical structure. Leaf objects are the smallest components in the logical structure. They will not have any other child objects associated

- The first domain will become the forest root domain. A domain tree contains its own root domain. But forests can contain multiple root domains.

- The rebeladminit.com and mytraining.ca both are root domains in their own domain trees. Both domains in the forest will trust each other with two-way transitive trust. Two-way transitive trust is a logical link between domains where the trusting domain honors the logon authentication of the trusted domain. When considering the previous example, users in rebeladminit.com can authenticate into mytraining.ca domain and vice versa.

- All domain trusts within the Active Directory forest are two-way transitive trusts. Two-way trust means the authentication requests can be processed between two domains in both ways. Transitive means it goes beyond the initial two-way trust between domains and trusts its child domains too even though there is no direct connection

- All these default OUs have different security policies attached. If
it really needs to be changed, it is important to compare the security
policies applied and reattached to the new OU if required. I highly
recommend that you do not modify/remove domain controllers' default
OU at least.

nce an object is assigned to an OU, it inherits security settings and permissions applied on
the OU level. If the same object is moved to a different OU, then it will apply the settings
from the new OU and discard the settings that were applied from the previous OU.

rganizational units are container objects. They
can be associated with similar or other objects. Similar to the domain parent-child
relation

The OU
hierarchy is independent. It is not going to affect any other domain OU hierarchy. The OU
also can contain objects from the same domain only


- The domain controller is a computer that runs a Windows Server operating system and
holds the Active Directory Domain Services role. It can be either a physical server or a
virtual server.

- The global catalog server holds the full writable copy of objects in its host domain and the
partial copy of the objects in other domains in the same forest. The partial replica contains a
copy of every object in the forest and the most commonly used attributes used by queries.
Applications and users in one domain can query for the objects in another domain (same
forest) via the global catalog server. All domain controllers in the domain will not be a
global catalog server by default.

The AD DS site defines a physical topology of the network. Sites can be separate buildings
in a campus network and branch office in a separate city or even in a separate country.. 
As
an example, Rebeladmin Corp. has its head office located in London office, UK. It is
running a few domain controllers (DC01 and DC02) within its physical network. It uses IP
address allocation for the network with subnets 192.168.148.0/24 , 10.10.10.0/24 and
172.25.16.0/24 . Due to the business requirements, the company opened a branch office
in Toronto, Canada. It got its own domain controllers (DC03 and DC04) running, but
logically, it is in the same Active Directory forest and domain. Both networks are
interconnected with a leased line. The Canada network uses IP subnets 10.11.11.0/24
and 172.0.2.0/24 :

the two offices can be called the two sites. This is because it is
clearly two network segments. The Active Directory logical design does not really consider
physical network segmentation. Since they are in the same domain and forest, DC01 to
DC04 should replicate changes to each other in order to maintain a healthy identity
infrastructure.

Since AD DS sites represent a physical network topology, when changes
are made to the physical topology, they needs to be updated on the AD DS
site configuration as well. A great example is when the IP address subnet
is added to the network

Mainly, there are three benefits we can identify:
Replication: In a typical AD DS setup, all domain controllers are set to replicate
changes between each other assuming all are connected via fast network links.

Service location: In the Active Directory setup, there are other services integrated
that help in company operations, for example, Active Directory certificate
services and exchange services.

Authentication: When a user logs in to the domain, they need to communicate
with the domain controller for authentication. In the preceding example, a user
on the Toronto site does not need to connect to a domain controller in the London
site for authentication.


