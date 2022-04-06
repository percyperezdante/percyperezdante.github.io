---
title: "Cmd"
date: 2022-01-10T14:30:13Z
---

### VIM

##### 0. Help
```
-  :help ins-completion
```

##### 1. Completion
```
- Ctrl-n          For  anything specified by 'complete'
- Ctrl-p          For  anything specified by 'complete'
- Ctrl-x Ctrl-f   To search files paths. Need start with path, eg. / or ./
```
```
- From help ins-completion 
  - 1. Whole lines						|i_CTRL-X_CTRL-L|
  - 2. keywords in the current file				|i_CTRL-X_CTRL-N|
  - 3. keywords in 'dictionary'				|i_CTRL-X_CTRL-K|
  - 4. keywords in 'thesaurus', thesaurus-style		|i_CTRL-X_CTRL-T|
  - 5. keywords in the current and included files		|i_CTRL-X_CTRL-I|
  - 6. tags							|i_CTRL-X_CTRL-]|
  - 7. file names						|i_CTRL-X_CTRL-F|
  - 8. definitions or macros				        |i_CTRL-X_CTRL-D|
  - 9. Vim command-line					|i_CTRL-X_CTRL-V|
  - 10. User defined completion				|i_CTRL-X_CTRL-U|
  - 11. omni completion					|i_CTRL-X_CTRL-O|
  - 12. Spelling suggestions				        |i_CTRL-X_s|
  - 13. keywords in 'complete'				|i_CTRL-N| |i_CTRL-P|
```

##### 2.  Cursor
```
- Command-/      Find cursor
- set cursorline
- highlight  CursorLine ctermbg=None ctermfg=Red
- set cursorcolumn
- highlight  CursorColumn  ctermbg=None ctermfg=Red
- set nocursorline
- set nocorsorcolumn 
- let g:netrw_winsize = 15
```

##### 3. Search
```
  - :vim /pattern/ file	  Search for a pattern in files, See results with quickfix
  - :cope[n]              " Open the quickfix window
  - :ccl[ose]             " Close the quickfix window
  - :cn[ext]              " Go to the next error
  - :cp[revious]          " Go to the previous error
  - :col[der]             " Go to older error list
  - :cnew[er]             " Go to newer error list
```

##### 4. Text
```
  - d-i-"	delete all between ", i=inner
  - d-i-w	delete Removes the word
  - d-i-t	delete Removes the tag inside HTML tags
  - d-i-p	delete the paragraph
  - d-i-s	delete Removes the sentence
  - d-i-{	delete Removes all between {
  - d-i-X	delete Removes all between X charactes, X=' " { } [ ]
  
  - c-f-X	Change until you FIND X. Find forward
  - c-F-X	Change until you FIND X. Find backwards
  - +	        To copy selected 'v' text to clipbaord
  - {count} C-G Show full path of the current file, use count=1 as default
```

##### 5. Terminal
```
  - Ctrl-B : term     Opens a terminal windows horizontal by default
  - Ctrl-w N          To scroll up and down, copy, etc. Vim style.
    - Press i or a    To back to the terminal
```

##### 6. Windows
```
  - C-w >	Increase width
  - C-w <	Reduce width
```

### CTAGS


### TMUX

##### 0. Help
```
  - C-b ?	Help short cuts
  - C-b t 	Show time
  - C-b w	Choose windows interactively
  - C-b :new    New session 
```

##### 1. Panes
```
  - C-d		close pane
  - C-b z	Full screen pane
  - C-b o	Focus next pane
  - C-b OPTION+ARROW KEY 	Resize pane
  - C-b [	Scroll,    press q to leave
       Function                     vi              emacs
       --------                     --              -----
       Half page down               C-d             M-Down
       Half page up                 C-u             M-Up
       Next page                    C-f             Page down
       Previous page                C-b             Page up
       Scroll down                  C-Down or C-e   C-Down
       Scroll up                    C-Up or C-y     C-Up
       Search again                 n               n
       Search again in reverse      N               N
       Search backward              ?               C-r
       Search forward               /               C-s

  - C-b { 	Move pane unti-clockwise
  - C-b } 	Move pane clockwise
  - C-b C-o        rotate window ‘up’ (i.e. move all panes)
  - C-b M-o        rotate window ‘down’
  - :move-pane -t <session_name>       Move pane to another session
  - C-b !          move the current pane into a new separate window (‘break pane’)
  - C-b SPACE	toogle between layouts
```

   
##### 2. Windows
```
  - C-b c 	Create new windows
  - C-b p/n	Go previous/next window
  - C-b #	Go to windows #
  - C-b ,	Rename your Windows
  - C-b $	Rename session
```

##### 3. Attach/Dettach
```
  - C-b d	Dettach
  - tmux ls     List
  - tmux attach -t #    Attach
```

##### 4. Copy paste
```
  - Add to ~/.tmux.conf.

     bind P paste-buffer
     bind-key -t vi-copy 'v' begin-selection
     bind-key -t vi-copy 'y' copy-selection
     bind-key -t vi-copy 'r' rectangle-toggle

     Note that for a newer tmux version (>2.4), the last three lines should be replaced with:

     bind-key -T copy-mode-vi v send-keys -X begin-selection
     bind-key -T copy-mode-vi y send-keys -X copy-selection
     bind-key -T copy-mode-vi r send-keys -X rectangle-toggle

  - Select  'v'
  - Copy to clipboard: 'y' ( or the default enter key)
  - Paste: Ctrl+b  P  ( p is upper case ) 
```

### 5. SSH AGENT
```
  - Instead of eval $(ssh-agent -s): 
    ps aux | grep ssh-agent 
    export SSH_AGENT_ID=2223
    ssh-add -k ~/.ssh/id_rsa  
```
    
###  iTerm2
  - https://gist.github.com/squarism/ae3613daf5c01a98ba3a

### GIT
```
  - PR SEARCH
    - gh pr list -s "Open" -A "testusername"

  - PR CREATE:
    - gh pr list
    - gh pr create -t "TITLE " -b "Main body comments"

  - PR ADD REVIEWERS:
    - gh pr list -A percy
    - gh pr edit 4048 --add-assignee percy # primary reviewer
    - gh pr edit 4048 --add-reviewer user1,user2,user3

  - PR REVIEW:
    - gh pr diff 5049
    - gh pr view 4048 -c
    - gh pr comment 4048 -b ' Thanks'

  - PR MERGE:  *only your pR*
    - gh pr merge 4048
	? What merge method would you like to use?  [Use arrows to move, type to filter]
	> Create a merge commit
	  Rebase and merge
	  Squash and merge
    - gh pr merge 4048 -m     

  - PR APPROVE:
    - gh pr list | grep 4078
    - gh pr view 4078
    - gh pr diff 4078
    - gh pr review 4078 --comment -b "LGTM"
    - gh pr review 4078 --approve 

  - PR CLOSE:
    - gh pr close {<number> | <url> | <branch>} [flags]

  - PR atlantis
    - gh pr comment 4097 -b "please apply"
    - gh pr comment 3234 -b '!merge'      

  - MISC:
    - Need to find where is StdCmd defined?
      $ git grep 'class StdCmd'
     
    - Need to find what templates use favicon_iurl ?
      $ git grep favicon_iurl | grep .tmpl
     
    - Who touched the file last?
      $ git log /file/path
     
    - Who touched that line last?
      $ git blame /file/path
     
    - Who probably has the most knowledge of that file?
      $ whotobug -v /file/path
      $ git who /file/path

  - Reload/re create
    -$ git fetch  -a
    -$ git reset --hard

  - List of branches by year
   - git branch -a --sort=-committerdate --format='%(refname)%09%(committerdate)' | awk '{ print $1,$6}' | grep 2020  | sed 's/refs\/remotes\/origin\///g' | awk '{ print "git push origin --delete "$1}' > 2020.list

```

### Source graph
```
  - srcGraph login
  - srcgraph search 'yatiri'
```

### net
```
  - dig www.yahoo.com
```

### Vimium
```
  - Ref:  
    - https://github.com/philc/vimium/blob/master/README.md

  - Current page:
    d       scroll down half a page
    u       scroll up half a page
    f       open a link in the current tab
    F       open a link in a new tab
    r       reload
    gs      view source
    yy      copy the current url to the clipboard
    yf      copy a link url to the clipboard
    >>      Move tab to the right
    <<      Move tab to the left
 
  - Navigation
    o       Open URL, bookmark, or history entry
    O       Open URL, bookmark, history entry in a new tab
    b       Open bookmark
    B       Open bookmark in a new tab

  - Manipulating tabs:
    t       create tab
    yt      duplicate current tab
    x       close current tab
    X       restore closed tab (i.e. unwind the 'x' command)
    T       search through your open tabs
    W       move current tab to new window

  - Marks:
    ma, mA  set local mark "a" (global mark "A")
    `a, `A  jump to local mark "a" (global mark "A")
    ``      jump back to the position before the previous jump
              -- that is, before the previous gg, G, n, N, / or `a

  - Extra:
    ]], [[  Follow the link labeled 'next' or '>' ('previous' or '<')
              - helpful for browsing paginated sites
    gi      focus the first (or n-th) text input box on the page. Use <tab> to cycle through options.
    gu      go up one level in the URL hierarchy
    gU      go up to root of the URL hierarchy
    ge      edit the current URL
    gE      edit the current URL and open in a new tab
```

### jq
```
  - jq .ResourceRecordSets[0,4]
  - jq .ResourceRecordSets[0:4]
  - Getting keys
    - jq '.ResourceRecordSets[0] | keys'
  - Getting lenght
    - jq '.ResourceRecordSets[0] | length'
  - Select all XTR entries
    - jq ' .ResourceRecordSets[] | select (.Type == "XTR")' a
  - Reg exp, all names that start with 5
    -  jq ' .ResourceRecordSets[] | select (.Name |test ("^5"))' a
```

### pdb
```
# https://web.stanford.edu/class/physics91si/2013/handouts/Pdb_Commands.pdf
  - l    		list
  - b    		list all break points
  - b 12 		Set break point at line 12
  - b myFunction	Set breakpoint to the function called myFunction
  - p(n) 		print the value of variable n 
  - cl   		clear all breakpoints 
  - c 			Continue
  - python -m pdb main.py -s applicationengine --dry-run
```

### python
```
  - venv:
    - python3 -m venv /path/to/new/virtual/environment
    - source env/bin/activate
```

### New bluetoooh keyboard
```
  - #    OPTION + 3
  - ~    FN+z
  - |    SHIFT+|
  - `    CONTROL+OPTION+ESC
  - screenshot    CMD+SHIFT+4
```

## AWS
- #### Documents
```
  - aws ssm list-documents --query 'DocumentIdentifiers[].Owner' | sort | uniq -c
  - aws ssm get-document --name CustomRunPuppetUpdateCommand
```

- #### R53 
```
  - Get hosted zones
    - aws route53 list-hosted-zones   
    - Get the most used: check the  ID
      - To sort:  
        - aws  route53 list-hosted-zones --query 'sort_by(HostedZones[],&ResourceRecordSetCount)[]'
    - aws route53 get-hosted-zone --id  /hostedzone/Z234asasdf2342S3

  - List of hosted zones
    - aws route53 list-hosted-zones

  - List all record names in a specific hosted zone id
    - aws route53 list-resource-record-sets --hosted-zone-id "/hostedzone/asdfasdf"

  - Show specific record name
    - aws route53 list-resource-record-sets --hosted-zone-id "/hostedzone/fwfwfw" --query "ResourceRecordSets[?Name == '15.1.133.10.in-addr.arpa.']"
```  

- #### Load balancers
```
  - aws elb describe-load-balancers
  - aws elb describe-load-balancers --query 'LoadBalancerDescriptions[0].Instances[]'
  - aws elb describe-load-balancers --query 'LoadBalancerDescriptions[0].ListenerDescriptions'
```

- #### VPC
```
  - aws ec2 describe-vpcs 
  - Get subnets:
    - aws ec2 describe-subnets --query 'Subnets[].[CidrBlock,SubnetId]' --output table
```

- #### RDS DB
```
  - aws rds describe-db-instances | jq '.DBInstances[] | {DBInstanceIdentifier,DBInstanceArn}'
```

- #### SSM
```
  - Show one specific parameter 
    aws ssm get-parameter --name "/eks-clusters/prometheus-test/secrets/cloudhealth-restful-key" --profile test
  - List all paremeters 
    aws ssm describe-parameters
```

- #### S3
```
  - List all content including hideen files .dot
    $ aws s3 ls tf-resource-test/vpc --recursive
```
