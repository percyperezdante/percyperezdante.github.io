---
title: "SRE MMR Week1"
date: 2020-04-02T22:54:36+01:00
---

# Introduction to SRE

### How does SRE differ from Devops?

Devops and SRE point to similar goals, which is break down organizational barriers to deliver software features faster.

Traditionally, developers are responsable for features and operations for stability. Developers want to move faster to release new features and operations want to move slow to keep all service stable. As a commong results, tension between teams appears during realease times. Devops and SRE practices aim to break downs this tensions.

In general, Devops approach include the following areas:

```toml
    - Reduce organizational silos: --> Break down tension promotes collaboration between teams.
    - Accept failure as normal
    - Implement gradual change: --> Small and incremental changes are easy to review and maintain.
    - Leverage tooling and automation
    - Measure as much as you can 
```

On the other side, SRE appraoch to same areas are as following:

```toml
    - Reduce organizational silos: --> Operation responsability to release in production is shared with developers.
    - Accept failure as normal: --> Blameless postmordem. Failure is expected and it is hold by an error budget.
    - Implement gradual change: --> Small and incremental release, such as Canary releases.
    - Leverage tooling and automation: -->  Measure toil and automate to minimise manual intervention.
    - Measure as much as you can: -->  Measure toil, reliability and service.
```

Therefore, one initial conclusion is that:

> **SRE is a concrete class that implements Devops**

### What is CRE?
It stands for Customer Reliability Engineering and it is focus on breaking down organizational barries between service prodivers and customers.  In this context, failure is pre-accepted as a conditions to enhance future cases, error budget.This pre-condition helps to minimise panic when a down time happens at the service level. Another important criteria is to implement measurements that can offer to everyone, in both sides, visibility of on how the service performs.

### How can they help you be more reliable?
In various cases, customers use provider's services, through APIs.  in different ways that are not expected by the service provider, and providers do not like to breaks the customer expectation. This sceneario is easly visible the number of customers scale up.

CRE helps to providers to openinly communicate with customers. Clear communication of how your service was designed to behave, indirectly means to expose provider's SRE practices, such is their SLOs, to the customers. By teaching or helping the customers to build their own SRE environment, we are teaching them how to interact correctly with our system or platform. Consequently, the real scope and limitations are presented clearly to the customer, which formilise what the customer can expect as a final result.

In conclusion, by sharing SRE practices with customers, not only new features can be released faster, it also enhance customer satisfactione.


### Why Are SLOs Important for Your Organization?
Building new features quickly leads to a negative correlation between development velocity and system reliability.  This means that development velocity implies the posibility to break another features that can also affect our customers. Therefore, measuring SLOs gives real indications of possibel effects on the expectation of customers when a new feature is released.You can plan proactively by estimating risks to your reliability from the roll-out of new features in terms of time to detection, time to resolution, and impact percentage. Also, if you have enough error budget you can reduce the effort to cover any potential risk.


# Targeting Reliability

### Introduction

### Promises, Promises. SLOs vs SLAs. Happiness Test.

### How Do We Measure Reliability? Edge Cases

### How Reliable Should a Service Be? Setting Targets for Reliability. Iterate!


# Operating for Reliability

### Introduction

### When Do We Need to Make a Service More Reliable? Error Budgets.


### Trading off Reliability Against Features

### How Do We Make a Service More Reliable?

