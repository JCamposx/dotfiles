" NERD Tree
let NERDTreeShowHidden=1
let g:NERDTreeHijackNetrw=0
let g:NERDTreeStatusline=''
let NERDTreeAutoDeleteBuffer = 1

" Easymotion
let g:EasyMotion_smartcase=1

" Airline
let g:airline_powerline_fonts=1

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDToggleCheckAllLines=1
let g:NERDCompactSexyComs = 0

" Emmet
let g:user_emmet_settings = {
\  'variables': {'lang': 'en'},
\  'html': {
\    'default_attributes': {
\    },
\    'snippets': {
\      'html:5': "<!DOCTYPE html>\n"
\              ."<html lang=\"${lang}\">\n"
\              ."<head>\n"
\              ."\t<meta charset=\"${charset}\">\n"
\              ."\t<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">\n"
\              ."\t<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
\              ."\t<title></title>\n"
\              ."</head>\n"
\              ."<body>\n\t${child}|\n</body>\n"
\              ."</html>",
\    },
\  },
\}
