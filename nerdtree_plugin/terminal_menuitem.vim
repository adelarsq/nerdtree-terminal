" NerdTree Plugin for search with terminal
if exists("g:loaded_nerdtree_terminal_menuitem")
  finish
endif

let g:loaded_nerdtree_terminal_menuitem = 1
let s:haskdeinit = system("ps -e") =~ 'kdeinit'
let s:hasdarwin = system("uname -s") =~ 'Darwin'

call NERDTreeAddMenuItem({
      \ 'text': '(t)erminal '.emoji#for('shell'),
      \ 'shortcut': 't',
      \ 'callback': 'NERDTreeTerminalSearch' })

function! NERDTreeTerminalSearch()
  let l:oldssl=&shellslash
  set noshellslash
  let treenode = g:NERDTreeFileNode.GetSelected()
  let path = treenode.path.str()

  let s:cmd = 'Nuake cd '.path.' ; bash '
  execute s:cmd

  let &shellslash=l:oldssl

  redraw!
endfunction
