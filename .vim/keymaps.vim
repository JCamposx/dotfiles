let mapleader=" "

" PLugins keybinds
nmap <silent> <Leader>t :NERDTreeToggle<CR>

" Buffers
nnoremap <silent> <C-X> :Buffers<CR>
inoremap <silent> <C-X> <Esc>:Buffers<CR>
vnoremap <silent> <C-X> <Esc>:Buffers<CR>

" Close tab
nmap <silent> <Leader>w :Bdelete<CR>

" Fzf
nmap <silent> <C-P> :Files<CR>

" Floating terminal
noremap <silent> <C-T> :FloatermToggle<CR>

" Save changes
nmap <C-S> :w<CR>
imap <C-S> <Esc><C-S>
vmap <C-S> <Esc><C-S>

" Quit VIM
nmap <C-Q> :q<CR>

" Change between tabs
nmap <silent> <Tab> :bn<CR>
nmap <silent> <S-Tab> :bp<CR>

" Split tabs
nmap <silent> <Leader>s :vsplit<CR><C-L>
nmap <silent> <Leader><S-S> :split<CR><C-J>

" Move line(s) down
nmap <silent> <A-Down> :m+1<CR>
imap <silent> <A-Down> <Esc><A-Down>a
vmap <silent> <A-Down> :m '>+1<CR>gv

" Move line(s) up
nmap <silent> <A-Up> :m-2<CR>
imap <silent> <A-Up> <Esc><A-Up>a
vmap <silent> <A-Up> :m-2<CR>gv

" Tab line on normal mode
nmap > >>
nmap < <<

" Tab lines visual mode
vnoremap > >gv
vnoremap < <gv

" Vertical move adjust
nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk

" Backspace on normal mode
nmap <BS> X
vmap <BS> x

" Undo
nmap <C-Z> u
imap <C-Z> <Esc>ui
vmap <C-Z> <Esc>u

" Redo
imap <C-R> <Esc><C-R>i
vmap <C-R> <Esc><C-R>

" Delete word before cursor
nmap <C-W> i<C-W><Esc><Right>

" Delete word after cursor
nnoremap <M-D> dw
nnoremap <M-d> dw
inoremap <M-D> <Esc><Right>dwi
inoremap <M-d> <Esc><Right>dwi

" Delete actual line
nmap <C-E> dd
imap <C-E> <Esc>ddA
vmap <C-E> D
vmap d D

" Delete below line
nmap <C-D> <Down><C-E><Up><End>
imap <C-D> <Esc><C-D>A

" Delete above line
nmap <C-C> -<C-E><End>
imap <C-C> <Esc><C-C>A

" Special enter
nnoremap = i<CR><Esc>
nnoremap ' o<Esc><Up>
nnoremap " O<Esc><Down>

" New line in insert mode
imap <M-CR> <Esc>o

" Multiple cursor
nmap <RightMouse> \\\
imap <RightMouse> <Esc>\\\

" Select multiple words
imap <C-N> <Esc><C-N>

" Select all lines
nmap <silent> <C-A> ggVG
imap <silent> <C-A> <Esc><C-A>

" Find words and replace
nmap <F2> \\A
imap <F2> <Esc><F2>

" Search words
nmap <C-F> /
imap <C-F> <Esc><C-F>
vmap <C-F> <Esc><C-F>

" Clear search highlighting
nmap <silent> <Leader>h :noh<CR>

" Comment line
nnoremap <silent> <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <silent> <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>

" Select suggestion with tab
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Quick ; at the end of line
nnoremap <silent> <M-;> :call setline('.', getline('.') . ';')<CR>
inoremap <silent> <M-;> <Esc>:call setline('.', getline('.') . ';')<CR>a

" Start terminal
nmap <M-,> :!
imap <M-,> <Esc><M-,>
vmap <M-,> <Esc><M-,>

" Go to function definition
nmap <silent> gd <Plug>(coc-definition)
