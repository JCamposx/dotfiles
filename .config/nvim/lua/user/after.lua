vim.cmd([[
  augroup VimOptions
    set laststatus=3

    highlight Visual guibg=#323844

    highlight ColorColumn guibg=#1e2227

    highlight CursorLine guibg=#252a33
    highlight CursorLineNr guibg=#252a33 guifg=#e4e4e4
    highlight CursorLineNrNC guibg=#252a33

    highlight ExtraWhitespace guibg=#5a0d0d

    highlight IlluminatedWordText guibg=#282c36
    highlight IlluminatedWordRead guibg=#282c36
    highlight IlluminatedWordWrite guibg=#282c36

    autocmd BufNewFile,BufRead *.lock set ft=json

    autocmd FileType php set tabstop=4 shiftwidth=4 softtabstop=4
    autocmd FileType blade set tabstop=2 shiftwidth=2 softtabstop=2

    autocmd FileType * vnoremap <nowait> <buffer> [ <Esc>`>a]<Esc>`<i[<Esc>lvwh]
    autocmd FileType * set formatoptions-=ro | set colorcolumn=81 | set autoindent

    set autoread
    autocmd CursorHold * checktime

    autocmd VimLeave * set guicursor=a:ver15
  augroup end
]])

vim.cmd("let g:better_whitespace_filetypes_blacklist=['', 'toggleterm']")
