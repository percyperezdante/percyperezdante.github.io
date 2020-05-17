---
title: "Kubernetes"
date: 2020-05-13T15:12:41+01:00
---

#### Reference

The following notes were extracted, adjusted or extended from the following references.

- [Kubernetes book by Nigel Poulton](https://www.amazon.com/Kubernetes-Book-Version-November-2018-ebook/dp/B072TS9ZQZ)

### General

- The cluster is made up of one or more masters, and a bunch of nodes.
- Package and deploy a Kubernetes application is done via a Deployment. With Deployments, we start out with our application code and we containerize it. Then we define it as a Deployment via a YAML or JSON manifest file. This manifest file tells Kubernetes two important features:

    - What our app should look like – what images to use, ports to expose, networks to join, how to perform update etc.
    - How many replicas of each part of the app to run (scale)

    Then we give the file to the Kubernetes master which takes care of deploying it n the cluste

- The API server

The API Server (apiserver) is the frontend into the Kubernetes control plane. It exposes a RESTful API that preferentially consumes JSON. We POST manifest files to it, these get validated, and the work they define gets deployed to the cluster.


- The cluster store

The config and state of the cluster gets persistently stored in the cluster store, which is the only stateful component of the cluster and is vital to its operation.The cluster store is based on etcd, the popular distributed, consistent and watchable key-value store. As it is the single source of truth for the cluster, you should take care to protect it and provide adequate ways to recover it if things go wrong.

- The controller manager

They tend to sit in loops and watch for changes, the aim is to make sure the current state of the cluster matches the desired state.

- The scheduler

Watches and executes new workloads.


