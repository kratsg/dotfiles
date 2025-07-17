" issues? https://superuser.com/questions/1115159/how-do-i-install-vim-on-osx-with-python-3-support
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'davidhalter/jedi-vim'
call plug#end()

" plugin configs
let g:jedi#show_call_signatures = 0
let g:jedi#show_call_signatures_delay = 0
let g:jedi#popup_on_dot = 0

" my configs
syn on
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set wildmode=longest,list
set smarttab
set tabstop=2
set shiftwidth=2
set expandtab
filetype indent on
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ruler
set tags=tags;/
set number
set background=dark
color slate
set formatoptions+=r
set maxmempattern=2000
set nofoldenable    " disable folding
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" make .tex.inc files tex-highlighted
au BufNewFile,BufRead *.tex.inc set filetype=tex
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd BufWritePre * :%s/\s\+$//e
