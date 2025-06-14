" ~/.vimrc: vim configuration file.

" Source files in runtime path ($HOME/.vim)
runtime abbreviations.vim

packloadall

set nocompatible
set sessionoptions-=options
set viewoptions-=options
filetype on
filetype plugin on
filetype indent on
set expandtab
set tabstop=4
set shiftwidth=4
inoremap jk <ESC>
" fzf keybinds
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
set autoread
set hlsearch
set ignorecase
set incsearch
set history=1000
set wildmode=longest,list
set noerrorbells
set hidden
set ruler
set cursorline
set tabpagemax=50
set ttimeout
set ttimeoutlen=50
set laststatus=2
set smarttab
"set spell spelllang=en_gb
let g:markdown_fenced_languages = ['html', 'python', 'ruby', 'vim', 'bash']
"Limit markdown to 100 column width
au BufRead,BufNewFile *.md setlocal textwidth=100

" When editing a file, always jump to the last known cursor position.
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif

" Use CTRL-L to clear the highlighting of 'hlsearch' (off by default) and call
" :diffupdate.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Correctly highlight $() and other modern affordances in filetype=sh.
if !exists('g:is_posix') && !exists('g:is_bash') && !exists('g:is_kornshell') && !exists('g:is_dash')
  let g:is_posix = 1
endif

let $FZF_DEFAULT_COMMAND = 'rg --files --hidden'

"Make tabs and trailing whitespace visible
exec "set listchars=tab:\uBB\uBB,trail:\uB7,nbsp:~"
set list

set scrolloff=1
set sidescroll=1
set sidescrolloff=2
set display+=lastline
if has('patch-7.4.2109')
  set display+=truncate
endif

if !has('gui_running') && &term =~ '^\%(screen\|tmux\)'
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
set termguicolors
silent! colorscheme slate
silent! colorscheme skull
silent! colorscheme retrobox
silent! colorscheme quiet
set background=light
syntax on

" Enable line wrapping for Markdown files
autocmd FileType markdown setlocal textwidth=100 wrap
" Fold markdown
"let g:markdown_folding = 1
