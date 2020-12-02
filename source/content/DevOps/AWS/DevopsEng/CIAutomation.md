---
title: "CIAutomation"
date: 2020-12-01T17:29:27Z
---


# II Designinh a Source control strategy with CodeCommit

- Devops covers at least the following areas:
    - Development workflows
    - Test, build, and deploy applications
    - Infrastructure as a code

- Why AWS
    - AWS is public cloud leader
    - AWS is a full platform of integration with other services.

- What is Devops
    > It is a blanket term for tooling, practices, and ideas that allow organization sto build better software - faster. It includes:
    - Source control systems
    - Agile software technologies
    - Infrastructure as a code
    - Automated testing
    - Automated deployment

- What is CI/CD
    - CI= Continuous integraation. This includes:
        - Commit your code to SCM
        - Build your code
        - Run tests
    - Continuous Delivery includes all stages in CI plus the followings:
        - Deploy to QA for testing
        - Request manual approval 
        - Deploy to Production
    - Continouos Deployment includes all stages mentioned before, except the "request for manaul approval "

- Version control systems, VCS
    - Distributed VCS:
        - Mercurial
        - Git
    - Centralised VCS
        - SVN
        - CVS
        - Perforce

- Git flow
    - Complicated
    - Great for maintain multiple versions of software
    - Popular before web
    - Github flow is well suited to web development: Vincent Driessen

- Github flow
    - Popular for web development
    - Encourage best practices with frequent smaller merges
    - Well suited for CI/CD practices.

- Benefits of CodeCommit-
    - You do not maintain the infra hosting your code
    - user and team management
    - Permission management
    - Integration with CI/CD tooling and testing workflows
    - Allow you code review and pull request approval workflow 

- Working with AWS CodeCommit

    - Using admin account create a CodeCommit repo
    - Add IAM user with specific permissions

    - Users can generate credentials  and used them to get CodeCommit repo 

- How to use CodeCommit
    - Open the CodeCommit console
    - Click Create repository
    - Type repository name
    - Click Create, this will create a repo using the root account. WE need to create IAM

    - Go to the IAM console
    - Creat new user by clicking "Users", left side
    - Type name of the user, select Programatic access and AWS management console access, click next
    - Add permissions to this user:
        - You can create  a group, click create group
        - Enter group name, for example : developers
        - Select policy:
            - You can select "poweruseraccess "policy if you do not know what to choose.
            - Also you can select "codecommit power user" policy
            - Click create group
        - Now that we have created a group, click it and it will add the user to this group
        - You can add tags if you need group users.
        - Click create user

        NOTE: **Once you click create, you will have ONLY ONE CHANGE TO copy**
            - Secret access key
            - Password
            - Access key ID
            - Sigin link 

            **----> Copy them to a safe place**

- First push to CodeCommit

    - Open the Signin as IAM user page
    - Enter you account ID, IAM user name, and password
    - Go then to the CodeCommit console 

    We need to create an SSH key for the repository we will work on:
        - Click on the repository
        - Click on SSH
        - From you local directory, generate a pair of SSH keys.
        - Upload the PUBLIC key in the AIM access manager 
            - Open AIM console
            - CLick on users, and find your user
            - Click en security credentials
            - CLick on "upload ssh key public"
            - Copy the SSH KEY ID

        - Add an entry in your `.ssh/config` file with the following

                Host git-codecomit.*.amazonaws.com
                User YOUR AIM SSH KEY ID 
                Identify ~/.ssh/id_rsa <-- private key

        Note:
            - .ssh/config permission should be 600
            - Now you can clone from your local as:

            $ git clone ssh://git-codecommit.us-east-1.amazonaws.clm/v1/repos/test

![Adding a ssh key](/devops/aws/devopseng/codecommitaddsshkey.png)

    








---
# III Infrastrcuture as a code


---
# IV Building and testing


---
# V Applic


---
# VI Creating Deployment Pipelines

