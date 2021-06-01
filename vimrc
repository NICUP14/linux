" general options
syntax on
filetype on
set nowrap
set number
set smartindent
set incsearch

" options for h/c/cpp files
autocmd BufRead,BufNewFile *.h,*.c,*.cpp setlocal cindent foldmethod=syntax
