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


### Who are CREs?



### How can they help you be more reliable?


### Why Are SLOs Important for Your Organization?


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

