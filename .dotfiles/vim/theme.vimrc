" Theme  / color / appearance vim settings


" Set an absolute line number on my curent line
" And a relative one relative to my current line
" For easier movement
set relativenumber
set number


""" COLORS """"

" Enable snytax highlthing
syntax on

" Color scheme
colorscheme sonokai " (https://github.com/sainnhe/sonokai)

" Use dark theme at night and light theme during day
" (UNUSED)
if (strftime("%H") < 18 && strftime("%") > 4)
else
""  colorscheme deus
endif

""" OTHER VISUAL SETTINGS """"

" Flash the line that contains the cursor
map ; :set cursorline<CR>:set cursorcolumn<CR>:sleep 140m<CR>:set nocursorline<CR>:set nocursorcolumn<CR>
 " ^ Above after these actions...
map n n;
map N N;
map # #;
map * *;
map zt zt;
map zz zz;
map zb zb;
" ^ Also flash after first search result.. 
cnoremap <expr> <CR> getcmdtype() =~ '[/?]' ? '<CR>:set cursorlin e<CR>:set cursorcolumn<CR>:sleep 140m<CR>:set nocursorline<CR>:se t nocursorcolumn<CR>' : '<CR>'                                 
" ^ Use bright yellow for the cursor location
hi CursorLine ctermbg=193
hi CursorColumn ctermbg=193

""" TERMINAL SETTINGS """"
set termguicolors

" The following 3 lines enable italic comments
highlight Comment cterm=italic
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"



""" PLUGIN-REQUIRED SETTINGS """"

" Dim inactive window (https://github.com/TaDaa/vimade)
let g:vimade = {}
let g:vimade.fadelevel = 0.7
let g:vimade.enablesigns = 1

