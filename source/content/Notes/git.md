---
title: "Git"
date: 2023-10-25T14:32:45Z
---

**1. Git authentication**
```bash
# Generate keys in your local. 
ssh-keygen -t ed25519 -C "myemail@tmail.com"

# Above will generate below two files.  Move them to .ssh/
$ ls -ltr .ssh/
total 24
-rw------- 1 ubuntu ubuntu 392 Oct 25 10:33 authorized_keys
-rw-r--r-- 1 ubuntu ubuntu 107 Oct 26 10:52 githubkey.pub

# create the following entry in .ssh/config
$ cat .ssh/config
Host github.com
  IdentityFile ~/.ssh/githubkey

# Be sure your repo is using ssh to fetch your repo( git@github.com...), not https
$ cat .git/config
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = git@github.com:percyperezdante/percyperezdante.github.io.git


# Copy your publickey to your github account.
In github GUI go to:
   - Settings
   - SSH and GPG keys 
   - Click on New SSH Key
   - Copy the publick key and write a name for your reference

# From your local repo, test your connection using your  ssh keys
$ ssh -T git@github.com

# Now you can pull and push with out typing your paasword
```

**2. Git basics**

```bash
# To list all commits
git log  --oneline

# To show the changes of one specific commit
git show <HASH_ID>
git show <HASH_ID> --name-status   

# To update a branch from remote master
git checkout master
git pull
git checkout mybranch
git merge master   # This will update your branch from remote master

# To check remotes
git remote -v     # To list all remote main URLs
git ls-remote    # To list remote branches


# To fetch specific branch
git fetch origin reomte_branch_name


# To checkout and track a remote branch
git checkout --track origin/remote_branch_name

# Delete files from local or remote repo
git rm --cached  filename
git rm filename


# Example for .gitignore
https://github.com/github/gitignore

# Regbase, and chery-pick
git pull --rebase
git cherry-pick HASH


```
