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
    
