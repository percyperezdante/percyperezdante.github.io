---
title: "Codecommitcmd"
date: 2020-12-21T11:55:40Z
---

Below are suggested steps to work with CodeCommit from Command line


1. Be sure you have a public key upload into your IAM profile

    - To check if you have already one or more public keys in AIM

        ```bash
            $ aws iam list-ssh-public-keys
            {
                "SSHPublicKeys": []
            }

        ```
    - If you have not any public key updated, then update one:
        ```bash
                $ aws iam upload-ssh-public-key \
                          --user-name percy  \
                          --ssh-public-key-body file:///home/percy/.ssh/id_rsa.pub
                {
                    "SSHPublicKey": {
                        "UserName": "percy",
                        "SSHPublicKeyId": "DDDDHJCVLNXXXXX",
                        "Fingerprint": "as:as:as:as:sa;as;ads",
                        "SSHPublicKeyBody": "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQC7NfDLDKNrUSU43MT+GRUME2cXkTs3Du4mnZqQSRNr2ZgD4y5N2En/9FNC6kHyOiEe8MCYIDAI/cZ017QmhPmYzp/n7fC4owMXIng6h0th097zUoYJ97r/P+gYufJB9rDo8NpmAnI/DPA4VNv+SfMm4TVBI1t4XbPiaIRhn3Nt972M0DDJsYg5IaC5xl22V3J/dqfwDvUpyNUsW0I60MtiTp1MRgGt5bmOdLmTaGsWffyIcMH5AT9MkjFbQ6OyG4VPQ/ohRyYS02CRzR6nmrqUu1wowoXyrBttVavg3c4B7053ig5D1OU8mwFeIm2e/yKXLQskUk3LnubMiKAyigpkpL/17bxFF19KGV9tmT/CBmXDPVAh+6awerasfdasfdauYX5LvoNGS3x5vmXuUmQJnNkGyV8bZu6h2erkqkF1ULtpCaLq2g+WXnA+ymOfXhmdDVWFtdvEZQ91E8M6ltgKcFb+wNFXRz5qiUwNCyTfkrtN+zHUOsvpIRMGL2U2vjyolAzjuVH8g+Vw5Sg96KSjv2qHiHdigbfRsI7ya+",
                        "Status": "Active",
                        "UploadDate": "2020-10-21T12:06:48+00:00"
                    }
                }

        ```

        Now you can double check that you have your key uploaded

        ```bash
            $ aws iam list-ssh-public-keys
            {
                "SSHPublicKeys": [
                    {
                        "UserName": "percy",
                        "SSHPublicKeyId": "DDDDDDXXXHaADFDASDF",
                        "Status": "Active",
                        "UploadDate": "2020-10-21T12:06:48+00:00"
                    }
                ]
            }

        ```

        For a specific user

        ```bash
            $ aws iam list-ssh-public-keys  --user-name percy
        ```

        From this output we need the `SSHPublicKeyId`

2. Create a repository in CodeComimt

    - Minimal

        ```bash
        $ aws codecommit create-repository \
                --repository-name MyDemoRepo \
                --repository-description "A demo repository"   

        {
            "repositoryMetadata": {
                "accountId": "2341234233434",
                "repositoryId": "27ada71-asfdasfdasdf-sdfasdfas",
                "repositoryName": "MyDemoRepo2",
                "repositoryDescription": "My demonstration repository2",
                "lastModifiedDate": "2020-10-21T12:52:05.031000+00:00",
                "creationDate": "2020-10-21T12:52:05.031000+00:00",
                "cloneUrlHttp": "https://git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo2",
                "cloneUrlSsh": "ssh://git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo2",
                "Arn": "arn:aws:codecommit:us-east-2:12334345234523:MyDemoRepo2"
            }
        }
        ```
        From here we will need the `cloneUrlSsh`    
    - Creating a repository with TAGS

        ```bash
        $ aws codecommit create-repository \
                --repository-name MyDemoRepo \
                --repository-description "A demo repository"   
                --tags Team=SuperDev
        ```

3.  Clone a remote repository 

    ```bash
    $ git clone ssh://SSHPublicKeyId@cloneUrlSsh

    # For example

    $ git clone ssh://SDFSDFGDFIDFGSF@git-codecommit.us-east-2.amazonaws.com/v1/repos/MyDemoRepo

    ```

    Where you can get your `SSHPublicKeyId` and `cloneUrlSsh` from

    ```bash
    $ aws iam list-ssh-public-keys  --user-name percy
    $ aws codecommit get-repository --repository-name MyDemoRepo

    ```


4. Testing

    ```bash
    $ cd MyDemoRepo
    $ echo " Jallalla ..."> test.txt
    $ git add .
    $ git commit -m "Jallalla message"
    $ git push origin master
    ```

    ![code commit push example](/devops/aws/devopseng/codecommitpushexample.png)

    You can verify this by login to the AWS console and browsing the "CODE COMMIT" console
