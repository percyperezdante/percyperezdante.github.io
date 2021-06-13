---
title: "Vim"
date: 2021-05-08T18:34:11+01:00
---

### Vim

#### Normal mode
```bash

Press A   Move to after last character on a line to insert a new character.
Press a   To insert text just after the cursor

Type  dw  to delete a word.
Type  d$  to delete to the end of the line.

Type  w   until the start of the next word, EXCLUDING its first character.
Type  e   to the end of the current word, INCLUDING the last character.
Type  $   to the end of the line, INCLUDING the last character.

Type  2w  to move the cursor two words forward.
Type  3e  to move the cursor to the end of the third word forward.
Type  0   (zero) to move to the start of the line.

Type  d2w to delete the two UPPER CASE words.
Type  2dd to delete two lines.

Press  u  to undo the last commands
Press  U  to fix(undo) a whole line.
Press Ctrl-R (keeping CTRL key pressed while hitting R) to redo the commands (undo the undo's).

Type  p   to put/paste previously deleted text after the cursor.
Type  r   to replace the character at the cursor
Type  R   to replace more than one character
Press ce  To change until the end of a word, c=change, e=end
Type  c$  To change until the end of the line

##############################################

Type  %   to find a matching ),], or }
Type  :s/old/new/g  to substitute 'new' for 'old'
          To change every occurrence of a character string between two lines,
               type   :#,#s/old/new/g    where #,# are the line numbers of the range
                                         of lines where the substitution is to be done.
               Type   :%s/old/new/g      to change every occurrence in the whole file.
               Type   :%s/old/new/gc     to find every occurrence in the whole file,
                                         with a prompt whether to substitute or not.

Type  o       To insert a blank line below, o lower case
Type  o       To insert a blank line above, O upper case

:set ic	      Ignore case sensitive. "noic" to disable.
:set hls      Highlight search. "nohls" to disable
:set is       Increase or progresive search. "nois" to disable

:set nocp     Type :e and press CTRL-d to list all commands that start with "e" 
              and TAB to select

###############################################

Ctrl-g    Location of the current file
          Type the number of the line you were on and then  G .  This will
          return you to the line you were on when you first pressed CTRL-G.

/         Search forwards
?         Search backwards

CTRL-o    "o" lowercase to  go back to where you came from.
CTRL-I    goes forward

Press v + : w FILENAME   Press v, select lines, Press :, and type "w test.txt". This
                         will save in test.txt the selected lines. Type "w! test.txt"
                         to overwrite

Type :r FILENAME         It will insert the content of FILENAME in the cursor location
                         For example type :r !ls to insert existing files


################################################

        :help w                    
        :help c_CTRL-D 
        :help insert-index         
        :help user-manual   
        :help vimrc-intro

```
### Vim with Netwr

```bash
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END


```

```bash
  ---			-----------------			----
	  Map			Quick Explanation			Link
	  ---			-----------------			----
 	 <F1>	Causes Netrw to issue help
	 <cr>	Netrw will enter the directory or read the file      |netrw-cr|
	 <del>	Netrw will attempt to remove the file/directory      |netrw-del|
	   -	Makes Netrw go up one directory                      |netrw--|
	   a	Toggles between normal display,                      |netrw-a|
		hiding (suppress display of files matching g:netrw_list_hide)
		showing (display only files which match g:netrw_list_hide)
	   c	Make browsing directory the current directory        |netrw-c|
	   C	Setting the editing window                           |netrw-C|
	   d	Make a directory                                     |netrw-d|
	   D	Attempt to remove the file(s)/directory(ies)         |netrw-D|
	   gb	Go to previous bookmarked directory                  |netrw-gb|
	   gh	Quick hide/unhide of dot-files                       |netrw-gh|
	 <c-h>	Edit file hiding list                             |netrw-ctrl-h|
	   i	Cycle between thin, long, wide, and tree listings    |netrw-i|
	 <c-l>	Causes Netrw to refresh the directory listing     |netrw-ctrl-l|
	   mb	Bookmark current directory                           |netrw-mb|
	   mc	Copy marked files to marked-file target directory    |netrw-mc|
	   md	Apply diff to marked files (up to 3)                 |netrw-md|
	   me	Place marked files on arg list and edit them         |netrw-me|
	   mf	Mark a file                                          |netrw-mf|
	   mh	Toggle marked file suffices' presence on hiding list |netrw-mh|
	   mm	Move marked files to marked-file target directory    |netrw-mm|
	   mp	Print marked files                                   |netrw-mp|
	   mr	Mark files satisfying a shell-style |regexp|         |netrw-mr|
	   mt	Current browsing directory becomes markfile target   |netrw-mt|
	   mT	Apply ctags to marked files                          |netrw-mT|
	   mu	Unmark all marked files                              |netrw-mu|
	   mx	Apply arbitrary shell command to marked files        |netrw-mx|
	   mz	Compress/decompress marked files                     |netrw-mz|
	   o	Enter the file/directory under the cursor in a new   |netrw-o|
		browser window.  A horizontal split is used.
	   O	Obtain a file specified by cursor                    |netrw-O|
	   p	Preview the file                                     |netrw-p|
	   P	Browse in the previously used window                 |netrw-P| qb	List bookmarked directories and history              |netrw-qb|
	   qf	Display information on file                          |netrw-qf|
	   r	Reverse sorting order                                |netrw-r|
	   R	Rename the designed file(s)/directory(ies)           |netrw-R|
	   s	Select sorting style: by name, time, or file size    |netrw-s|
	   S	Specify suffix priority for name-sorting             |netrw-S|
	   t	Enter the file/directory under the cursor in a new tab|netrw-tYXXY
	   u	Change to recently-visited directory                 |netrw-u|
	   U	Change to subsequently-visited directory             |netrw-U|
	   v	Enter the file/directory under the cursor in a new   |netrw-v|
		browser window.  A vertical split is used.
	   x	View file with an associated program                 |netrw-x|

	   %	Open a new file in netrw's current directory         |netrw-%|
```
[3]


```bash

  For inside a windows and in normal mode
  https://catswhocode.com/vim-commands/
 gx   Open URL in default browser
 gt   Next tab



```

### Vim scripts

# Reference

https://shapeshed.com/vim-netrw/

https://learnvimscriptthehardway.stevelosh.com/

[3] http://vimdoc.sourceforge.net/htmldoc/pi_netrw.html#netrw


[4] https://iccf-holland.org/vim_books.html

[5] https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/


