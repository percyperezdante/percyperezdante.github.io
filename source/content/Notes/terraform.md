---
title: "Terraform"
date: 2022-02-07T11:44:22Z
---


## 1. [Terraform plugin cache](https://www.terraform.io/cli/config/config-file)

By setting this variable, Terraform allows to cache all provider plugins in a local directory. Note that provider plugins could be large. Therefore, if you do not use this feature, terraform will download these provider plugins in all directories or spaces where you call *terraform init*. This means it will use more disk space, redundancy of plugins,  and potentially slow compare with caching plugins locally.

#### How to set:
```
export TF_PLUGIN_CACHE_DIR="$HOME/.terraform.d/plugin-cache"
```
Or create a *.terraformrc* file in your $HOME folder and add the following
```
plugin_cache_dir = "$HOME/.terraform.d/plugin-cache"
```

#### Example
```
percy@BRIX:uswest2-dev[]$ terraform init
percy@BRIX:uswest2-dev[]$ terraform plan
percy@BRIX:uswest2-dev[]$ ls -ltra
total 28
drwxrwxr-x 3 percy percy 4096 Jan 31 08:17 ..
-rw-rw-r-- 1 percy percy  151 Feb  7 07:01 provider.tf
-rw-r--r-- 1 percy percy 1107 Feb  7 10:50 .terraform.lock.hcl
-rw-rw-r-- 1 percy percy 4032 Feb  7 11:20 terraform.tfstate
-rw-rw-r-- 1 percy percy  227 Feb  7 11:21 general.tf
drwxr-xr-x 3 percy percy 4096 Feb  7 11:22 .terraform
drwxrwxr-x 3 percy percy 4096 Feb  7 11:29 .
percy@BRIX:uswest2-dev[]$ tree .terraform
.terraform
└── providers
    └── registry.terraform.io
        └── hashicorp
            └── aws
                └── 3.74.0
                    └── linux_amd64 -> /home/percy/.terraform.d/plugin-cache/registry.terraform.io/hashicorp/aws/3.74.0/linux_amd64

6 directories, 0 files
percy@BRIX:uswest2-dev[]$ tree ~/.terraform.d/
checkpoint_cache      checkpoint_signature  plugin-cache/         
percy@BRIX:uswest2-dev[]$ tree ~/.terraform.d/plugin-cache/
/home/percy/.terraform.d/plugin-cache/
└── registry.terraform.io
    └── hashicorp
        └── aws
            └── 3.74.0
                └── linux_amd64
                    └── terraform-provider-aws_v3.74.0_x5
```

#### Note
Using the previous example. You could remove the provider.tf ( content below ), the .terraform.lock.hcl and the .terraform. Then, terraform init/plan still works because it is useing the local cache.

```
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}
```

## 2. terraform.tfstate file

This file is created, by default in the same folder when terraform is invoqued,  when "terraform apply" is executed. It contains the last uptodate state of the resources in the provider. For example, if you delete this file, terraform concludes that there resource does not exists and will try to create it.  

Another way to create the terraform.tfstate file is to import from the provider. For example in the case of AWS, the following will import the configuration of the instance i-0001 into a state file called aws_instance.app_server, then you can re-use it in your .tf files of your project.

```
$ cat general.tf
provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-xxxx"
  instance_type = "t2.micro"

  tags = {
    Name = "2-ExampleAppServerInstance"
  }
}


$ terraform import aws_instance.app_server i-0001
$ terraform state list
aws_instance.app_server


```
