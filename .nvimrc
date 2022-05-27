syntax enable
filetype plugin indent on

set number
set mouse=a
set numberwidth=3
set clipboard=unnamed
set showcmd
set showmatch
set relativenumber
set laststatus=2
set wrap linebreak
set breakindent
set noshowmode
set ignorecase
set termguicolors
set cursorline
set updatetime=1
set autoindent expandtab ts=4 sw=4

let loaded_netrwPlugin=1

autocmd VimEnter * NERDTree
autocmd VimEnter */workspace/* NERDTree| wincmd p

" autocmd FileType markdown let b:coc_suggest_disable = 1
" autocmd FileType text let b:coc_suggest_disable = 1

autocmd FileType html setlocal autoindent ts=2 sw=2 expandtab
" autocmd FileType blade setlocal autoindent ts=2 sw=2 expandtab
autocmd BufNewFile,BufRead *.blade.php set ft=html | set ft=blade | set syntax=html

autocmd FileType * set formatoptions-=ro

so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim
so ~/.vim/keymaps.vim
so ~/.vim/theme.vim
