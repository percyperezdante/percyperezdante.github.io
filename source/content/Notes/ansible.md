---
title: "Ansible"
date: 2021-01-16T15:49:01Z
---

#  General

Ansible cnetralizes model:

![ansible general diagram](/notes/ansiblegeneraldiagram.png)
- Adhoc example:

    
    ```bash
    $ ansible -m copy -a "src=orignalFile.txt dest=finalFile.txt" --check --diff localhost

    ```
    Where  
    - Check = to run in dry mode 
    - Diff  = Shows the difference before and after apply ansible
    - "copy" is a module, list of [all ansible modules in here](https://docs.ansible.com/ansible/2.8/modules/list_of_all_modules.html)
    - "m" module name
    - "a" arguments

    More examples
    ![ansible examples adhoc](/notes/ansibleadhocexamples.png)


# Playbook

- A [playbook](https://docs.ansible.com/ansible/latest/user_guide/playbooks.html) uses a [Yaml](https://yaml.org/) file as main place to read from. 

- A task can be visualise as:

![tasks components](/notes/ansibletaskstructure.png)

- To run playbook:

    ```bash
    $ ansile-playbook playbookFile.yml
    ```

- Ansible-playbook calls the "setup" module, which is mask as "Gathering facts " in the logs, and it can be executed manually as:

    ```bash
    $ ansible -m setup localhost
    ```

    This helps to understand the current state of an environment.

    
    NOTE:

    You can disable this feature "gathering facts" in the playbook, see below. It will speed up the run.

    ![setting false gathering facts](/notes/ansibleremovegatherfacts.png)


- More output lines

    You can add more verbose, "-v",  to the output:

    ```bash
    $ ansible-playbook playbook.yml -v
    $ ansible-playbook playbook.yml -vv
    $ ansible-playbook playbook.yml -vvv
    $ ansible-playbook playbook.yml -vvvv
    ```

- Output meaning:

    To understand the output logs, you can refer to the documentation of the module you are working on, or
    you can use `ansible-doc` to get information about a module from command line

    ```bash
    $ ansible-doc copy
    ```
- Another example
    ![indentataion ansible](/notes/ansibleindentationexample.png)
    
# Inventory

- Ansible ignore the following extensions:

    ```bash
    $ ansible-config --list

    ...
    INVENTORY_IGNORE_EXTS:
      default: '{{(BLACKLIST_EXTS + (''.orig'', ''.ini'', ''.cfg'', ''.retry''))}}'
      description: List of extensions to ignore when using a directory as an inventory
        source
    ...

    ```
- Ansible does not recommend to use "."  as part of the name of a hosts or group of hosts

    ```bash
    Not replacing invalid character(s) "{'.'}" in group name (new_group_jenkins_agents.ol7)
    [WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
    Not replacing invalid character(s) "{'.'}" in group name (newgroup_jenkins_agents.ol7)
    Not replacing invalid character(s) "{'.'}" in group name (oldgroup_jenkins_agents.olh6)

    ```
- Ansible graph  presents hosts in different format:

    ```bash
    $ ansible-inventory --graph
    [WARNING]: Invalid characters were found in group names but not replaced, use -vvvv to see details
    @all:
      |--@backup_coordinator_group.ol7:
      |  |--hostonw.dcnet
      |--@bitbucketgroup.ol6:
      |  |--host2.dcnet
      |  |--host2b.dcnet
      |--@bitbucketgroup.ol6:
      |  |--host3.cdnet
      |--@health_checker_group.ol7:
      |  |--host4.dcnet

    ```

- To run on any of this groups:

    ```bash
    $ ansible -m command -a "ls -ltr " bitbucketgroup
    $ ansible -m command -a "ls -ltr " host4.dcnet

    ```
- Some useful links

    - [ Ansible error handling ](https://docs.ansible.com/ansible/latest/user_guide/playbooks_error_handling.html)
    - [ Ansible use of varibles ](https://docs.ansible.com/ansible/latest/user_guide/playbooks_variables.html)

- Steps to consider to use inventories:

    - Config ansible using "ansible.cfg"
        ```bash
        [default]
        # disale host_key_chkcings
        # https://docs.ansible.com/ansible/latest/user_guide/connection_details.html
        host_key_checking = False
        
        inventory=myDirectory
        # export ANSIBLE_INVENTORY = /path/directory/inventory
        # FYI : "vagrant ssh-config " is a great guide for configuring ansible to
        # connect directly to VMs created by vagrant
        ```
        
