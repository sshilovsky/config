set foldmethod=syntax
%foldopen!

augroup sshilovsky_ft_c
    autocmd!
    autocmd bufwritepost <buffer> silent make tags | redr!
augroup END

