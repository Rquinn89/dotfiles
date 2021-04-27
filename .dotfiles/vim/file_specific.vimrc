"Settings for specific types of files
"
"
"
" Syntax highlight XX.tmux.conf files as .tmux.conf 
augroup tmux_hl
  au!
  autocmd BufNewFile,BufRead *.tmux.conf set syntax=tmux
augroup END


