---
title: "Kubernetes"
date: 2020-05-13T15:12:41+01:00
---

#### Reference

The following notes were extracted, adjusted or extended from the following references.

- [Kubernetes book by Nigel Poulton](https://www.amazon.com/Kubernetes-Book-Version-November-2018-ebook/dp/B072TS9ZQZ)
- [Kubernetes setup ](https://kubernetes.io/docs/setup/)
- [Kubernetes the hard way](https://github.com/kelseyhightower/kubernetes-the-hard-way)
- [Kubernetes network administraion ](https://kubernetes.io/docs/concepts/cluster-administration/)
- [Google Kubernetes Engine: GKE docs](https://cloud.google.com/kubernetes-engine/docs/how-to)
- [AWS Elastic Container Service for Kubernetes EKS](https://aws.amazon.com/getting-started/hands-on/deploy-kubernetes-app-amazon-eks/)
- [Kubectl docs](https://kubernetes.io/docs/reference/kubectl/)

### General

- Kubernetes is a container orchestrator, which means to maintain, manage and support container that run applications. Kubernetes also manage workload placement, it offers an infrastructure abstraction and maintains a desire state of the infrastructure.

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

### Architecture

- The sole way to interact with a Kubernetes cluster is through API over HTTP using JSON.
- The core API primitives of a kubernetes cluster includes:
    - Pods
    - Controllers
    - Services
    - Storage

    #### PODS

    - Pods is a core API primitive that contains one or more containers.
    - Pod is the most basic unit of work (atomicity) and it is a unit of scheduling.
    - Pods are ephemeral, which means that a destroyed pod can not be re-deployed. Once a pod is destroyed, it never comes back.
    - Kubernetes job is to keep up and ranning all pods and applications running on them. To do that:
        - Kubernetes tracks the state of the pods.
        - Check health about whether the application inside the pod is running.
        - Kubernetes checks the health of pods and applications through "liveness probes", which are responses to health check requests.

    
## Workloads

### Command lines

- Kubectl:
    - Relies on config file: $HOME/.kube/config. This file contains target cluster anme and credentials.
    
    ```bash
        $ gcloud container clusters get-credentials CLUSTER_NAME --zone ZONE_NAME   # Authorizes interact with GCP from command line
        $ kubectl config view  # view current config
        $ kubectl COMMAND  TYPE NAME FLAGS
              COMMAND= what do you want to do
              TYPE= on which type of object
              NAME=Name fo the object
              FLAGS=Extra information

    ```

    - GKE basics
        - Create a cluster
        ```bash
            $ export MY_zone=us-central2-a
            $ export MY_cluster=test-cluster-1

            $ # To create a GKE cluster with default paramaters. You can choose more from [here](https://cloud.google.com/sdk/gcloud/reference/container/clusters/create)
            $ gcloud container clusters create $MY_cluster --num-nodes 3 --zone $MY_zone --enable-ip-alias

            $ # To increase the number of nodes. To verify this, from the GUI click on  kubernetes enginet -> clusters
            $ gcloud container clusters resize $MY_cluster --zone $MY_zone --num-nodes=4

        ```
        - Connect to the cluster

            To create a kubeconfig file: 
            - we need the credentials of the current user,to allow authentication and 
            - provide the endpoint details for a specific cluster, to allow communicating with that cluster through the kubectl command-line
            
        ```bash
            $ # this command will create ~/.kube/config
            $ gcloud container clusters get-credentials $my_cluster --zone $my_zone

        ```

        You have to run above command to connect to a cluster created by another user or in another environment.
        This comamnd is also let you switch between  the active context to a different cluster.

        - Inspect the cluster

        ```bash
            $ # To see the config
            $ kubectl config view

            $ # Print the cluster information for the active context
            $ kubectl cluster-info

            $ # To print the active context
            $ kubectl config current-context

            $ # To print details for all the cluster contexts in the kubeconfig file
            $ kubectl config get-contexts

            $ # To change context
            $ kubectl config use-context gke_${GOOGLE_CLOUD_PROJET}_us-west1-d_standart-cluster-3

            $ # To view the resource usage across the nodes of the cluster
            $ kubectl top nodes

            $ # To view the resource usage acrossthe nodes of the cluster
            $ kubectl top nodes

            $ # To enable bash autocompletion for kubectl
            $ source <(kubectl completion bash)
        ```
        NOTE:  The full name of the cluster, which includes the gke prefix, the project ID, the location, and the display name, all concatenated with underscores.


        - Deploy pods

        ```bash
            $ # To deploy nginx as a pod and named nginx-1
            $ kubectl create deployment --image nginx nginx-1
                
            $ #  to view all the deployed Pods in the active context cluste
            $ kubectl get pods

            $ # export your pod name and verify your env variable
            $ export MY_nginx_pod=nginx-1-74ca2123b22-nvxx

            $ # See details of the pod you creatd
            $ kubectl describe pod $MY_nginx_pod

            $ # Copy a test.html into the container
            $ kubectl cp ~/test.html $MY_nginx_pod:/usr/share/nginx/html/test.htmly
             
            $ # Expose the Pod through services 
            $ kubectl expose pod $MY_nginx_pod --port 80 --type LoadBalancer

            $ # To view details of a service. Repeat this a couple of times before see the external IP
            $ kubectl get services

            $ # verify that we can access the test.html
            $ curl http://EXTERNAL_IP_ADDRESS/test.html

            $ # To view the resources beign used by the nginx pod
            $ kubectl top pods
        ```


        - To introspec GKE pods

        ```bash
            $ # Clone the following 
            $ 
            $ cat ak8s/shell/newNginxPod.yaml
            apiVersion: v1
                kind: Pod
                metadata:
                  name: new-nginx
                  labels:
                    name: new-nginx
                spec:
                  containers:
                  - name: new-nginx
                    image: nginx
                    ports:
                    - containerPort: 80
            $ kubectl apply -f ./newNginxPod.yaml
            $ kubectl get pods

            $ # Connect to the container, and make some modifications to test.html
            $ kubectl exec -it newNginx /bin/bash

            $ # enable port forwarding to connect to the pod from cloud shell
            $ # From 10082 of the cloud shell to port 80 of the nginx container
            $ kubectl port-forward newNginx 10082:80

            $ # From a second cloud shell 
            $ curl http://127.0.0.1:10081/test.html
        ```

        - View logs

        ```bash
            $ # In a new cloud shell
            $ kubectl logs newNginx -f --timestamps
        ```


