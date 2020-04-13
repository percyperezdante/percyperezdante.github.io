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

    - Web interface
    - SDK
    - Command line
    - API
    - Mobile App

All resources in GCP are organised into projects.Optionally, this projects can be organised into folder and subfolders. All these projects, folders and subfolders that belongs to an organisation can be brought under an organisation node. Each project  is separated compartiment and usually have the following id:

    - Project ID:  Global inmutable unique name chosen by you.
    - Project name: Can be mutable and chosen by you.
    - Project number: Global inmutable number given by GCP.

On the other hand, a policy is set on a resource, where each policy contains a set of roles and role members. Resources inherit policies from parents, where a less restrictive policy overrides a more restrictive resource policy. For example, if a organisation node policy is set to read only, but a project policy is set to read and write, then read and write is possible for that project. Take in mind this when you design your policies.

The Identity and Access Management, IAM, helps to manage access rights to currents users of a project. There are three parts:

    - Who: Identifies the user or resource, such as google or service account, group, domain. 
    - AIM Role: A collection of permissions: primitive, predefined, and custom. 
        - Primitive are broad an include: owner, editor , viewer and billing administrator. 
        - Predefined: Pre designed rules that can be used.
        - Custom: Where you design and set your own rules.
    - Resource: 

