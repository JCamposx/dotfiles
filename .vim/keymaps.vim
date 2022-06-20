let mapleader=" "

" PLugins keybinds
nnoremap <silent> <Leader>t :CocCommand explorer<CR>

" Telescope files
nnoremap <silent> <C-P> :Telescope find_files hidden=true<CR>
inoremap <silent> <C-P> <Esc>:Telescope find_files hidden=true<CR>
vnoremap <silent> <C-P> <Esc>:Telescope find_files hidden=true<CR>

" Telescope words
nnoremap <silent> <C-T> :Telescope live_grep<CR>
inoremap <silent> <C-T> <Esc>:Telescope live_grep<CR>
vnoremap <silent> <C-T> <Esc>:Telescope live_grep<CR>

" Telescope buffers
nnoremap <silent> <C-X> :Telescope buffers sort_lastused=true<CR>
inoremap <silent> <C-X> <Esc>:Telescope buffers sort_lastused=true<CR>
vnoremap <silent> <C-X> <Esc>:Telescope buffers sort_lastused=true<CR>

" Close tab
nnoremap <silent> <Leader>w :Bdelete<CR>

" Split tabs
nnoremap <silent> <Leader>s :vsplit<CR><C-L>
nnoremap <silent> <Leader><S-S> :split<CR><C-J>

" Vertical resize
nnoremap <silent> = :vertical resize +2<CR>
nnoremap <silent> - :vertical resize -2<CR>

" Horizontal resize
nnoremap <silent> + :resize +2<CR>
nnoremap <silent> _ :resize -2<CR>

" Save changes
nnoremap <C-S> :w<CR>
inoremap <C-S> <Esc>:w<CR>
vnoremap <C-S> <Esc>:w<CR>gv

" Quit
nnoremap <C-Q> :q<CR>
inoremap <C-Q> <Esc>
vnoremap <C-Q> <Esc>:q<CR>

" Move line(s) down
nnoremap <silent> <A-Down> :m+1<CR>
inoremap <silent> <A-Down> <Esc><A-Down>a
vnoremap <silent> <A-Down> :m '>+1<CR>gv

" Move line(s) up
nnoremap <silent> <A-Up> :m-2<CR>
inoremap <silent> <A-Up> <Esc><A-Up>a
vnoremap <silent> <A-Up> :m-2<CR>gv

" Tab line on normal mode
nnoremap <Tab> >>
nnoremap <S-Tab> <<

" Tab lines visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Vertical move adjust
nnoremap <Down> gj
vnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Up> gk

" Move between words adjust
nnoremap <C-Right> w
vnoremap <C-Right> w
nnoremap <C-Left> b
vnoremap <C-Left> b

" Backspace adjust
nnoremap <BS> X
vnoremap <BS> x

" Undo
nnoremap <C-Z> u
inoremap <C-Z> <Esc>ui
vnoremap <C-Z> <Esc>ugv

" Redo
inoremap <C-R> <Esc><C-R>i
vnoremap <C-R> <Esc><C-R>

" Delete word before cursor
nnoremap <C-W> i<C-W><Esc><Right>

" Delete word after cursor
nnoremap <M-D> dw
nnoremap <M-d> dw
inoremap <M-D> <Esc><Right>dwi
inoremap <M-d> <Esc><Right>dwi

" Special enter
nnoremap ; i<CR><Esc>
nnoremap ' o<Esc><Up>
nnoremap " O<Esc><Down>

" New line in insert mode
inoremap <M-CR> <Esc>o

" Select all lines
nnoremap <silent> <C-A> ggVG
inoremap <silent> <C-A> <Esc><C-A>

" Find words and replace
nmap <F2> \\A
imap <F2> <Esc><F2>

" Clear search highlighting
nnoremap <silent> <Leader>h :noh<CR>

" Comment line
nnoremap <silent> <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <silent> <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>

" Select suggestion with tab
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Quick ; at the end of line
nnoremap <silent> <M-;> :call setline('.', getline('.') . ';')<CR>
inoremap <silent> <M-;> <Esc>:call setline('.', getline('.') . ';')<CR>a

" Coc functions GoTo
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)

" Coc hide normal mode popup
nnoremap <silent> <Esc> :nohlsearch \| match none \| 2match none \| call coc#float#close_all()<CR>
