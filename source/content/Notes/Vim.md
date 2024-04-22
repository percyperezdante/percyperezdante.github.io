---
title: "Vim"
date: 2021-05-08T18:34:11+01:00
---

## VimScript
1. Debugging
```bash
:echom "this is breakpoint"  
:messages       --> show echom messages only, echo messages are not saved.

$MYVIMRC   --> special variable that points to ~/.vimrc

```

2. Setting
```bash
:set <name>:<value>
:set number!     ---> This to unset numbers
:set matchtime?  ---> Use ? to check options
:set number numberwidth=4  ---> many settings in one line
```
3. Mapping
- 3.1 Normal mode: map or nmap
```bash
:map - x    ---> Put cursor somewhere and press  - to delete a character
:map - dd   ---> Press - and it will delete the line
:map <space> viw   ---> Press space and Vim selects the word
:map <c-d> dd   ---> Press Ctrl+d to delete a line
:nunmap -      ---> Remove a nmap linked to -
:nmap dd 0<esc>jddk   --> this is in infinite recursive loop it calls dd just after the j.
:nunnap dd   ---> To remove dd mapping
:nmap x dd   --|
:nnoremap \ x ---> This is a NON Recursive map. When press \, Vim does not map x to dd, it just delete a character, which is normal for x in normal mode
                   I usually use non recursive maps

```


- 3.2 Insert mode: imap
```bash
:imap <c-d> dd    ---> Press Ctrl+d, Vim will insert two d
:imap <c-d> <esc>dd    ---> Press Ctrl+d, Vim will exit insert mode and delete a line. Then you are in normal mode
:imap <c-d> <esc>ddi   ---> Press Ctrl+d, Vim will exit insert mode and delete a line. Then back to insert mode
:inoremap \ x   ---> it insert an x when you press \. 

```

- 3.3 Visual mode: vmap
```bash
:vnoremap \ x    --> Press \, Vim remove a char 

```
4. Leader and localleader
```bash
:let mapleader=","     ---> Set , as the key leader
:nnoremap <leader>d dd  ---> Press ,d and Vim will delete a line

:let maplocalleader = ","    ---> set localleader to ,
:nnoremap <localleader>f :echo "This is a local leader mapping"<CR>   ---> Press ,f and vim will print a message
:nnoremap <leader>t :vsplit $MYVIMRC<cr>    ---> Press leader+t and Vim will open .vimrc in split windows
:nnoremap <leader>sv :source $MYVIMRC<cr>    ---> Press leader+sv and Vim will source .vimrc
:nnoremap <leader>ev :wq<cr>    ---> Press leader+ev and Vim will save file and close split
:nnoremap <leader>" viw<esc>a"<esc>b"<esc>lel    ---> Press leader " and Vim will surround the word with double quotes

```
5. Abbreviations: for insert, replace and command modes
```bash
:iabbrev adn and   --> in insert mode, after typing adn and space, vim will replace adn by and
```

### Vim
```bash
git clone https://github.com/vim/vim.git
cd vim/src
./configure --with-features=huge \
            --enable-multibyte \
            --enable-python3interp=yes \
            --with-python3-command=python3 \
            --enable-cscope \
            --prefix=/home/pal/tools/vim
make
make install

```
#### Windows arrangement
```bash
Ctrl+w |     full zoom of a splitted windows

```
#### Editing Text
```bash
2di"	Two times + delete + all inside "
2da"	Two times + delete + all inside " including "
2ca"	Two times + change + all inside " including " + set in insert mode
va"    	Visual mode + around(all inside) "   --> selects all inside "

``` 
#### Moving inside a Text
```bash
[{	Search for the next {}
[(	Search for the next ()

zfat	zf=fold a=around t=tab --> To fold a HTML tag
l       to unfold HTML tag


```
#### Moving inside a file
```bash
Crtl + y    Scroll up without moving cursor
Crtl + e    Scroll down without moving cursor

```
#### Normal mode
```bash

Press A   Move to after last character on a line to insert a new character.
Press a   To insert text just after the cursor

Type  dw  to delete a word.
Type  d$  to delete to the end of the line.

Type  w   until the start of the next word, EXCLUDING its first character.
Type  wy  Copy to buffer one word next to the cursor. You can paste it with p
Type  yw  Copy to register the word where the cursor is locate. You can paste it with p
Type  b   until start to the PREIVOUS word
Type  e   to the end of the current word, INCLUDING the last character.
Type  $   to the end of the line, INCLUDING the last character.
Type  X   uppper case X to delete the previous char
Type  x   lower case x to delete the char where the cursor is

Type  2w  to move the cursor two words forward.
Type  3e  to move the cursor to the end of the third word forward.
Type  2yy Copy to buffer next two lines. Paste them with p
Type  0   (zero) to move to the start of the line.
Type  ^   To go at the beginning of a line
Type  4   To go at the end of a line

Type  d2w to delete the two next words.
Type  d2b to delete the two previous words.
Type  d0  to delete all from current possiont to the beginning of the line
Type  2dd to delete two lines
Type  2dw3w  To delete two next words and move cursor three words forward

Press  u  to undo the last commands
Press  U  to fix(undo) a whole line.
Press Ctrl-R (keeping CTRL key pressed while hitting R) to redo the commands (undo the undo's).

Type  p   LOWER CASE to put/paste previously deleted text after the cursor.
Type  P   UPPER CASE to put/paste previously deleted text BEFORE the cursor.
Type  r   to replace the character at the cursor
Type  R   to replace more than one character
Press ce  To change until the end of a word, c=change, e=end
Type  c$  To change until the end of the line
Type  z+enter	Keeps your cursor in the current possition and moves the rest of the text up to the screen

##############################################
Registers
""   	Holds text from d,c,s,x,y. This is the unknown register
"0	Holds last yanked text
"1 	Holds last deleted or changed text
:reg	list all registers
:reg d	show the register d
:reg 3d	show the register d and register 3
"9p	To paste the content of the regsiter 9
"_dd 	Deleteea line and put it in the black hole regsiter. You can not undo it or paste it.
"ayy	Yanks one line to the register a. 29 rgisters in total [a-z]
"Ayy	A upper case. Appends the line to the existing value in register a.

[register][count]operator	 
[count][register]operator	 
"b2p	Copy two times the content of regsiter b

##############################################

Type  %   to find a matching ),], or }
##############################################
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
        :help normal-index         
        :help user-manual   
        :help vimrc-intro
	:help windows

```
### Vim help
```
:h    			Short for :help
:h :d + Ctrl D		Autocompletion for everything staring with :d, d could be different letter
   			Ctrl+D matches the patterns that starts with :d or anything the user is looking for
:h :d + TAB		Will autocomplete with the next available match. TAB again to get the next match
:h :d + SHIFT+TAB	Will autocomplete with the PREVIOUS available match. 
Ctrl ]			To get into the link of the documentation  where the cursor is
Ctrl o			TO jump to the previous link
Ctrl i			TO jump to the next link
:h ^g			To search more options starting with g, Replace g with another pattern
```

### Vim search and back last page
```bash
:grep -r <cword> /path/to/search 	Search for the word located under the prompt in all folders and jump to the first one
:e#					re-open the previous opened file
:dt,					delete from the current position until one char before you find a ","
:dt)					delete from the current position until you find a ")"
:dT,					same as dt, but search backwards. Deletes from "," until current position
:dT)					same as dt) but search backwards. Deletes from "," until current position
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

### Netwr Create
```bash
- Create a new file inside a folder:
  - ":Explore"
  - Press ESC
  - Press % ( Shift + 5 )
  - Write file name and enter

```

### Vim scripts

# Reference

https://shapeshed.com/vim-netrw/

https://learnvimscriptthehardway.stevelosh.com/

[3] http://vimdoc.sourceforge.net/htmldoc/pi_netrw.html#netrw


[4] https://iccf-holland.org/vim_books.html

[5] https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/


Command line inside Vim
[6] https://unix.stackexchange.com/questions/523090/vim-autostart-with-vexplore-and-terminal

