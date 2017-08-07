colorscheme koehler
highlight Folded guibg=darkblue guifg=white
highlight MatchParen ctermbg=black

augroup sshilovsky
autocmd!

" Autosource config on modifying (main file only so far)
autocmd bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

augroup END

set number
set showcmd
set ruler

map <Space> <Leader>
noremap <Leader>w :wall<CR>
noremap <Leader>q :confirm q<CR>

imap <C-^> <Esc><C-^>

set backup
set backupdir=$XDG_DATA_HOME/nvim/backup,$HOME/.local/share/nvim/backup,.
set backupext=.bak
" TODO set backupskip=.passwords,.ssh/*

set wildignore=*.o,a.out,*.pyc

set hidden
set noautoread
set autowrite

" TODO make filetype-dependent
set tags=./tags;/,~/.local/share/ctags/usr-local-include,~/.local/share/ctags/usr-include
set path=.,/usr/local/include,/usr/include

set listchars=tab:>-,trail:~
set hlsearch
