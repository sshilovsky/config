Most of these bundles should be converted to submodules
But some of them are already converted.

1. neco-ghc is.
    DEP: ghc-mod : debian (warn: emacs)
    URL: https://github.com/eagletmt/neco-ghc

2. ghcmod-vim is.
    DEP: ghc-mod 2.1.2 : cabal [ happy : debian ]
    DEP: vimproc.vim : bundle
    URL: https://github.com/eagletmt/ghcmod-vim

3. vimproc.vim is.
    URL: https://github.com/Shougo/vimproc.vim
    ACT: have to be compiled with its Makefile

# vim: ft=
