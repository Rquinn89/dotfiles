" General settings for vim 

" Set up tags to look in parent directoryj
set tags=tags;/
" Set up tags for Rust
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

""" INDENT SETTINGS """"
" Indent options
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" Automatically set indent per file type
 filetype on
 filetype plugin on
 filetype indent on

 
""" WINDOW/TAB SETTINGS """"
" Window split locations
set splitbelow " Open new splits below
set splitright " Or open them to the right

""" PATH SETTINGS """
set autochdir

""" PLUGIN-REQUIRED SETTINGS """"

"Auto-save enable (https://github.com/907th/vim-auto-save)
let g:auto_save =1



