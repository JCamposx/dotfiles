" Theme Onedark
let g:onedark_termcolors=256
let g:onedark_terminal_italics=1
colorscheme onedark

" Theme Gruvbox
" let g:gruvbox_contrast_dark='hard'
" colorscheme gruvbox

" Status bar
let g:airline_theme='wombat'

" Current line background
highlight CursorLine guibg=#282828
highlight Visual guibg=#383838
highlight ColorColumn guibg=#353535

" Coc Custom Theme
highlight Pmenu guibg=#282828
" highlight Pmenusel guibg=#dfac3f
highlight PmenuSbar guibg=#353535
highlight PmenuThumb guibg=#606060

" Remove termnial background
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE
highlight clear SignColumn
