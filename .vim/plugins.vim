call plug#begin('~/.vim/plugged')

" Syntax
Plug 'sheerun/vim-polyglot'

" IDE
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'yggdroot/indentline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'famiu/bufdelete.nvim'
Plug 'voldikss/vim-floaterm'
Plug 'honza/vim-snippets'
Plug 'gregsexton/MatchTag'

" Autocomplete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'mattn/emmet-vim'

" Git
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'

" Typing
Plug 'townk/vim-autoclose'
Plug 'jiangmiao/auto-pairs'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-surround'

" Themes
Plug 'joshdick/onedark.vim'

" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
