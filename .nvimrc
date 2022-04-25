syntax enable
filetype plugin on

set number
set mouse=a
set numberwidth=3
set clipboard=unnamed
set showcmd
set ruler
set showmatch
set sw=2
set relativenumber
set laststatus=2
set wrap linebreak
set breakindent
set noshowmode
set ignorecase
set termguicolors
set cursorline
set updatetime=1


let loaded_netrwPlugin=1


autocmd VimEnter * NERDTree
autocmd BufEnter NERD_tree_* | execute 'normal R'
autocmd VimEnter */workspace/* NERDTree| wincmd p


aug python
  autocmd FileType python setlocal noexpandtab sw=2
aug end


autocmd FileType markdown let b:coc_suggest_disable = 1
autocmd FileType text let b:coc_suggest_disable = 1


autocmd FileType * set formatoptions-=ro


so ~/.vim/plugins.vim
so ~/.vim/plugins-config.vim
so ~/.vim/maps.vim
so ~/.vim/theme.vim
