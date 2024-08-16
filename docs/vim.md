# Vim Motions

`:Tutor` => Interactive Neovim Tutorial

## Move

- [h] left
- [j] down 
- [k] up
- [l] right

- [w] word forward
- [b] word backward
- [e] end of current word

- [%] move to matching (, [, or {

- [0] move to position 0 in line
- [_] move to text start in line
- [$] move to end of line

- [g]+[g] move to start of file
- [G] move to end of file
- [7]+[G] move to line #7

### Horizontal Movements

- [f]+[(] move to next `(` in line
- [F]+[(] move to previous `(` in line
- [t]+[(] move before the next `(` in line
- [T]+[(] move before the previous `(` in line
- [,] repeat move going backwards
- [;] repeat move going forwards

### Vertical Movements

- [{] move to previous paragraph
- [}] move to next paragraph
- [Ctrl]+[d] move half page down
- [Ctrl]+[u] move half page up

### Advanced Horizontal Movements 

- [y]+[i]+[(] select everything inside of the parenthesis
- [y]+[i]+[{] select everything inside of the braces
- [y]+[a]+[(] select everything including the parenthesis
- [y]+[a]+[{] select everything including the braces

### Advanced Vertical Movements 

- [=] auto indent based on rules

- [y]+[a]+[p] copy entire paragraph
- [c]+[i]+["] replace text in quotes

- [g]+[Ctrl]+[a] increment first number in line

## Mode

- [i] insert mode (left of cursor)
- [a] insert mode (right of cursor)
- [I] insert mode (start of line)
- [A] insert mode (end of line)
- [o] insert mode (new line below cursor)
- [O] insert mode (new line above cursor)

- [v] visual mode

## Action

- [y] copy (yank)
- [p] paste after cursor
- [P] paste before cursor

- [x] delete letter under cursor
- [r] replace letter under cursor
- [R] replace multiple letters starting at cursor

- [y]+[y] copy entire line
- [V]+[y] copy entire line
- [V]+[Y] copy entire line

- [d]+[w] delete word
- [d]+[d] delete line
- [d]+[$] delete rest of line

- [c]+[e] change until end of word
- [c]+[$] change until end of line 

- [u] undo
- [U] undo whole line
- [Ctrl]+[r] redo

- [Ctrl]+[6] switch between 2x files
- [Ctrl]+[^] switch between 2x files

- [/] search forwards
- [?] search backwards
- [*] search forwards for word under cursor
- [#] search backwards for word under cursor
- [n] next item in search 
- [N] previous item in search 

- [:]+[!] run external shell commands (linux only)
- `:!pwd` run external command `pwd` (linux only)
- `:!ls -al` run external command `ls -al` (linux only)

## Substitute
- `:s/old/new/`: substitute first occurance in line
- `:s/old/new/g`: substitute all occurances in line
- `:%s/old/new/g`: substitute all occurances in file

## Insert Mode - Digraphs

- `:dig`: show list of all available digraphs
- [Ctrl]+[k] enter digraph (foreign or special character)
    - [a]+['] á
    - [e]+['] é
    - [e]+[`] è
    - [e]+["] ë
    - [u]+[:] ü
    - [n]+[~] ñ

## Help

- [F1] open neovim help 
- `:help` open neovim help

- [Ctrl]+[w] jump from help window to main window

