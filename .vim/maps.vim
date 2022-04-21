let mapleader=" "

nmap <C-F> <Plug>(easymotion-s2)
nmap <Leader>t :NERDTreeFind<CR>
nmap <Leader>w :bd<CR>

" Save changes
nmap <C-S> :w<CR>
imap <C-S> <Esc><C-S>

" Quit VIM
nmap <C-Q> :q<CR>

" Change between tabs
nmap <Tab> :bn<CR>
nmap <S-Tab> :bp<CR>

" Paste
nmap <C-V> p
imap <C-V> <Esc>pi<Right>

" Copy and paste actual line to below
nmap <C-Down> yyP<End>
imap <C-Down> <Esc><C-Down>i<End>

" Copy and paste actual line to above
nmap <C-Up> yyp<End>
imap <C-Up> <Esc><C-Up>i<End>

" Backspace on normal mode
nmap <BS> X

" Undo
nmap <C-Z> :undo<CR>
imap <C-Z> <Esc><C-Z>i

" Redo
imap <C-R> <Esc><C-R>i

" Delete word before cursor
nmap <C-W> diw

" Delete word after cursor
nmap <C-Del> daw
imap <C-Del> <Esc><Right>dawi

" Delete actual line
nmap <C-E> dd
imap <C-E> <Esc>ddi<End>

" Delete below line
nmap <C-D> <Down><C-E><Up><End>
imap <C-D> <Esc><C-D>i<End>

" Special enter
nnoremap \ i<CR><Esc>
nnoremap ' o<Esc>
nnoremap " O<Esc>

