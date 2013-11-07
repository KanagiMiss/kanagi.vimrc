set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


"my config
syntax on " 自动语法高亮
colorscheme desert" 设定配色方案
set number " 显示行号
set tabstop=4 " 设定 tab 长度为 4
set softtabstop=4 " 使得按退格键时可以一次删掉 4 个空格
set go=e
set shortmess=atI   " 去掉欢迎界面
set autoindent
set showcmd         " 显示命令
set incsearch       " 增量式搜索
set ignorecase      " 搜索时忽略大小写
set ai              " 自动缩进
set si              " 智能缩进
set showmatch       " 显示匹配的括号
set autowrite
" map control-backspace to delete the previous word
:imap <C-BS> <C-W>
