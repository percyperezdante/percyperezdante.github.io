---
title: "Jfrog"
date: 2020-08-27T14:09:26+01:00
---


### 1. How to install a local Jfrog (open source)

The following shows how to install a local Jfrog (OSS) in a Linux-base host.

- Open [https://jfrog.com/open-source/#artifactory](https://jfrog.com/open-source/#artifactory)
- Select the OS you are working with: Linux, Windows or Mac and click on "Click here to Download"

In our case we could directly download the tar file for Linux:

```bash
$ mkdir myJfrog
$ cd myJfrog

$ wget https://api.bintray.com/content/jfrog/artifactory/org/artifactory/oss/jfrog-artifactory-oss/$latest/jfrog-artifactory-oss-$latest-linux.tar.gz?bt_package=jfrog-artifactory-oss

$ ls -tlr
total 811768
-rw-rw-r-- 1 percy percy 831242240 Aug 26 17:28 jfrog-artifactory-oss-7.7.3-linux.tar

$ tar -zxvf jfrog-artifactory-oss-7.7.3-linux.tar

$ cd artifactory-oss-7.7.3/app/bin
$ ls -trl
total 556
-rwxr-xr-x 1 percy percy  29279 Jul 13 13:17 systemYamlHelper.sh
-rwxr-xr-x 1 percy percy  96527 Jul 13 13:17 systemDiagnostics.sh
-rwxr-xr-x 1 percy percy 171933 Jul 13 13:17 migrate.sh
-rwxr-xr-x 1 percy percy 143122 Jul 13 13:17 installerCommon.sh
-rwxr-xr-x 1 percy percy   6879 Aug 12 10:55 uninstallService.sh
-rwxr-xr-x 1 percy percy   4387 Aug 12 10:55 migrationZipInfo.yaml
-rwxr-xr-x 1 percy percy   6539 Aug 12 10:55 migrationRpmInfo.yaml
-rwxr-xr-x 1 percy percy   4073 Aug 12 10:55 migrationDockerInfo.yaml
-rwxr-xr-x 1 percy percy   4283 Aug 12 10:55 migrationComposeInfo.yaml
-rwxr-xr-x 1 percy percy  10606 Aug 12 10:55 installService.sh
-rwxr-xr-x 1 percy percy  17401 Aug 12 10:55 artifactory.sh
-rwxr-xr-x 1 percy percy   9365 Aug 12 10:55 artifactoryManage.sh
-rwxr-xr-x 1 percy percy   1553 Aug 12 10:55 artifactory.default
-rwxr-xr-x 1 percy percy    382 Aug 12 10:55 artifactoryctl
-rwxr-xr-x 1 percy percy  32294 Aug 12 10:55 artifactoryCommon.sh

$ ./artifactory.sh

```
- Open in a browser: `http://localhost:8082`
- To login you can use the default admin account: admin/password.



