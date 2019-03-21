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
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone

" make .tex.inc files tex-highlighted
au BufNewFile,BufRead *.tex.inc set filetype=tex
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro
autocmd BufWritePre * :%s/\s\+$//e
