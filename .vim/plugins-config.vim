" Netrw
let g:netrw_fastbrowse = 0

" Airline
let g:airline_powerline_fonts=1

" NERD Commenter
let g:NERDSpaceDelims=1
let g:NERDToggleCheckAllLines=1
let g:NERDCompactSexyComs = 0

" Indenline
let g:indentLine_fileTypeExclude=["coc-explorer"]

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
