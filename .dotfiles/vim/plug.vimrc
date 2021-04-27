" Enable fzf
set rtp+=/opt/homebrew/opt/fzf

" Plugged plguin loads
call plug#begin('~/.vim/plugged')
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'sainnhe/sonokai'
Plug 'TaDaa/vimade'
call plug#end()


" load plugins (Vim default plugin loading)
packloadall
"
