---
title: "Git"
date: 2023-10-25T14:32:45Z
---

**1. Git basics**

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
```
