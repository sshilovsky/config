" Don't forget to do :PlugInstall when adding plugins
" See https://github.com/junegunn/vim-plug README for other commands

"" Rust support
" DEPENDENCIES: cargo, rustfmt, racer, rust-src
" $ rustup install # cargo
" $ rustup component add rust-src # rust-src
" $ cargo install rustfmt racer [--force]
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'

" rust debugging:
" https://github.com/critiqjo/lldb.nvim
" https://www.youtube.com/watch?v=rd654OxlmQs&feature=youtu.be
"
" OTHER OPTIONS ARE ALSO AVAILABLE!!!

"" General programming
Plug 'neomake/neomake'
Plug 'ervandew/supertab'

Plug 'janko-m/vim-test'
