syn on
set incsearch
set ignorecase
set smartcase
set scrolloff=5
set wildmode=longest,list
set smarttab
set tabstop=8
set shiftwidth=2
set expandtab
set hlsearch
:nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set ruler
set background=dark

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
