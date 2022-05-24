let mapleader=" "

" PLugins keybinds
nmap <Leader>f <Plug>(easymotion-s2)
nmap <Leader>t :NERDTreeToggle<CR>
nmap <Leader>r :NERDTreeFocus<CR>RR<C-L>

" Save changes
nmap <C-S> :w<CR>
imap <C-S> <Esc><C-S>
vmap <C-S> <Esc><C-S>

" Quit VIM
nmap <C-Q> :q<CR>

" Change between tabs
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

" Split tabs
nmap <Leader>s :vsplit<CR>
nmap <Leader><S-S> :split<CR>

" Close tab
nmap <Leader>w :b#<bar>bd#<CR>

" Move line(s) down
nmap <A-Down> :m+1<CR>
imap <A-Down> <Esc><A-Down>a
vmap <A-Down> :m '>+1<CR>gv

" Move line(s) up
nmap <A-Up> :m-2<CR>
imap <A-Up> <Esc><A-Up>a
vmap <A-Up> :m-2<CR>gv

" Change between windows
nmap <A-Left> <C-H>
nmap <A-Right> <C-L> 

" Tab line on normal mode
nmap > >>
nmap < <<

" Tab lines visual mode
vnoremap > >gv
vnoremap < <gv

" Vertical move adjust
nnoremap <Down> gj
inoremap <Down> <C-O>gj
vnoremap <Down> gj
nnoremap <Up> gk
inoremap <Up> <C-O>gk
vnoremap <Up> gk

" Backspace on normal mode
nmap <BS> X
vmap <BS> x

" Undo
nmap <C-Z> <Esc>:undo<CR>
imap <C-Z> <Esc><C-Z>i
vmap <C-Z> <Esc><C-Z>

" Redo
imap <C-R> <Esc><C-R>i

" Delete word before cursor
nmap <C-W> i<C-W><Esc><Right>

" Delete word after cursor
nmap <C-Del> dw
imap <C-Del> <Esc><Right>dwi

" Delete actual line
nmap <C-E> dd
imap <C-E> <Esc>ddA
vmap <C-E> D<CR>

" Delete below line
nmap <C-D> <Down><C-E><Up><End>
imap <C-D> <Esc><C-D>A

" Delete above line
nmap <C-C> -<C-E><End>
imap <C-C> <Esc><C-C>A

" Special enter
nnoremap = i<CR><Esc>
nnoremap ' o<Esc>
nnoremap " O<Esc>

" New line in insert mode
imap <M-CR> <Esc>o

" Multiple cursor
nmap <RightMouse> \\\
imap <RightMouse> <Esc>\\\

" Select multiple words
imap <C-N> <Esc><C-N>

" Select all lines
nmap <C-A> ggVG
imap <C-A> <Esc><C-A>

" Find words and replace
nmap <F2> \\A
imap <F2> <Esc><F2>

" Search words
nmap <C-F> /
imap <C-F> <Esc><C-F>
vmap <C-F> <Esc><C-F>

" Clear search highlighting
nmap <Leader>h :noh<CR>

" Comment line
nnoremap <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>
vnoremap <Leader>/ :call nerdcommenter#Comment(0,"toggle")<CR>

" Select suggestion with tab
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<C-g>u\<TAB>"

" Quick ; at the end of line
nmap <M-;> A;<Esc>
imap <M-;> <Esc>A;

" Start terminal
nmap <M-,> :!
imap <M-,> <Esc><M-,>
vmap <M-,> <Esc><M-,>
