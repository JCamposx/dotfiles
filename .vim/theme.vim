" Theme
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

" Status bar
let g:airline_theme='wombat'

" Current line background
highlight CursorLine guibg=#303030
highlight Visual guibg=#303030

" Floaterm border background
hi FloatermBorder guibg=#303030
hi FloatermNC guibg=#303030

" Remove termnial background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
highlight clear SignColumn
