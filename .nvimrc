syntax enable
filetype plugin indent on
set encoding=UTF-8

set number
set numberwidth=3
set relativenumber
set mouse=a
set clipboard=unnamed
set showcmd
set showmatch
set laststatus=2
set wrap linebreak
set breakindent
set noshowmode
set ignorecase
set termguicolors
set cursorline
set updatetime=1
set autoindent expandtab ts=4 sw=4

autocmd User CocNvimInit :CocCommand explorer

autocmd FileType html setlocal autoindent ts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=blade | set syntax=html
autocmd BufNewFile,BufRead *.ejs set ft=html | set syntax=html

autocmd FileType * set formatoptions-=ro

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver15
augroup END

so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim
so ~/.vim/keymaps.vim
so ~/.vim/theme.vim
