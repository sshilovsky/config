set nocompatible

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

colorscheme koehler

set number
syntax enable
filetype indent plugin on

augroup sshilovsky
autocmd!
autocmd bufwritepost ~/.vimrc source %
augroup END

set mouse=a
set backspace=indent,eol,start

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set autoindent

let mapleader=','
noremap <Leader>w :update<CR>
noremap <Leader>W :wall<CR>
noremap <Leader>q :quit<CR>
noremap <Leader>Q :confirm quit<CR>
noremap <Leader>wq :wq<CR>

noremap ; q:
noremap <Space> i

set ruler
set showcmd

set backupdir=./.backup,/tmp,.
if has('win32') || has('win64')
	set backupdir=./.backup,c:/temp,.
endif
set backupext=.bak
set backup

