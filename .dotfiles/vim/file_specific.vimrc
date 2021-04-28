"Settings for specific types of files
"
"
"
" Syntax highlight XX.tmux.conf files as .tmux.conf 
augroup tmuxconf_hl
  au!
  autocmd BufNewFile,BufRead *.tmux.conf set syntax=tmux
augroup END

" Syntax highlight XX.zshrc files as .zshrc
augroup zshrc_hl
  au!
  autocmd BufNewFile,BufRead *.zshrc set syntax=zsh
augroup END
