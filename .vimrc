source ~/.dotfiles/vim/general.vimrc " General settings
source ~/.dotfiles/vim/plug.vimrc " Load plugins
source ~/.dotfiles/vim/theme.vimrc " Theme and color settings
source ~/.dotfiles/vim/maps.vimrc " Mapped key settings
source ~/.dotfiles/vim/functions.vimrc " Custom Functions
source ~/.dotfiles/vim/file_specific.vimrc " File specifc


" Auto re-source vimrc when any of these files are saved..
augroup vimscript_source
  au!
    au BufWritePost ~/.vimrc source <afile>
    au BufWritePost ~/.dotfiles/vim/* source <afile>
augroup END

