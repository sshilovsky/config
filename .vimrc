set nocompatible

let g:pymode = 0
let g:pymode_syntax = 1
let NERDTreeIgnore = ['\.pyc$']

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
highlight MatchParen ctermbg=black

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
set tabstop=8
set softtabstop=4
set smarttab
set expandtab
set autoindent

map <Space> <Leader>
noremap <Leader>w :wall<CR>
noremap <Leader>q :confirm q<CR>
noremap <Leader>ss iSergei Shilovsky <sshilovsky@gmail.com><ESC>

noremap ; q:

map <F9> :make -f ~/.vim/universal.mk<CR>
map <C-F9> :make! -f ~/.vim/universal.mk run<CR>
map <F10> :make! -f ~/.vim/universal.mk gdb<CR>

map <F5> :NERDTree<CR>

imap <C-^> <Esc><C-^>

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

set wildignore=*.o,a.out,*.pyc

set hidden
set autowrite

set tags=./tags;/,~/.local/share/ctags/usr-local-include,~/.local/share/ctags/usr-include
set path=.,/usr/local/include,/usr/include

set hls
set lcs=tab:>-
