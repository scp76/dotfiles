if exists("b:current_syntax")
  finish
endif

syn match txtComment "^#.*$"
syn match txtComment "^\~\~\~.*$"
syn match txtComment "^===.*$"
hi txtComment ctermfg=DarkGrey guifg=DarkGrey

let b:current_syntax = "txt"
