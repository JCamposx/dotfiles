" Theme
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

" Status bar
let g:airline_theme='wombat'

" Current line background
highlight CursorLine guibg=#282828
highlight Visual guibg=#282828
highlight ColorColumn guibg=#282828

" Remove termnial background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
highlight clear SignColumn
