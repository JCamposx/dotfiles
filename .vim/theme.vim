" Theme
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

" Status bar
let g:airline_theme='wombat'

" Current line background
highlight CursorLine guibg=#202020

" Remove termnial background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
" highlight clear LineNr
highlight clear SignColumn
