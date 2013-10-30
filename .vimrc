set nocompatible

" On Windows, also use '.vim' instead of 'vimfiles'; this makes synchronization
" across (heterogeneous) systems easier.
if has('win32') || has('win64')
  set runtimepath=$HOME/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,$HOME/.vim/after
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()
call pathogen#helptags()

syntax enable
colorscheme koehler
highlight Folded guibg=darkblue guifg=white

set number
filetype indent plugin on
set foldlevel=1

augroup sshilovsky
autocmd!
" Autosource ~/.vimrc on modifying
autocmd bufwritepost ~/.vimrc source %
" Autorun NERDTree on starting vim
" autocmd vimenter * NERDTree | wincmd p
" Autoquit vim when only NERDTree left: https://github.com/scrooloose/nerdtree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
augroup END

set mouse=a
set backspace=indent,eol,start

set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set expandtab
set autoindent

let mapleader=','
noremap <Leader>w :update<CR>
noremap <Leader>q :confirm q<CR>
noremap <Leader>ss iSergei Shilovsky <sshilovsky@gmail.com><ESC>

noremap ; q:
nnoremap <Space> i

map <F9> :update<bar>make<CR>
map <C-F9> :update<bar>make run<CR>
map <S-F9> :update<bar>make gdb<CR>

map <F5> :NERDTree<CR>

set ruler
set showcmd

set backupdir=./.backup,/tmp,.
if has('win32') || has('win64')
	set backupdir=./.backup,c:/temp,.
endif
set backupext=.bak
set backup

" Disable pylint checking every save
let g:pymode_lint_write = 0

