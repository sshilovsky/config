set nocompatible

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

colorscheme koehler

syntax enable

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
noremap <Leader>W :update<CR>
noremap <Leader>s :update<CR>
noremap <Leader>S :update<CR>
noremap <Leader>q :quit<CR>
noremap <Leader>Q :quit<CR>

noremap ; q:
noremap <Space> i

set ruler
set showcmd

set backupdir=./.backup,/tmp,.
set backupext=.bak
set backup

