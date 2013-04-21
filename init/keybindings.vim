" Keybindings
" -----------

let mapleader = ","
let maplocalleader = ";"

" Search
"nmap <leader>s  :%s/
"vmap <leader>s  :s/

" Split screen
map <leader>v   :vsp<CR>

" Move between screens
"map <leader>w   ^Ww
"map <leader>=   ^W=
"map <leader>j   ^Wj
"map <leader>k   ^Wk
nmap <C-j>      <C-w>j
nmap <C-k>      <C-w>k
nmap <C-h>      <C-w>h
nmap <C-l>      <C-w>l

" Reload .vimrc
map <leader>rv  :source ~/.vimrc<CR>

" File tree browser
map \           :NERDTreeToggle<CR>

" File tree browser showing current file - pipe (shift-backslash)
map \|          :NERDTreeFind<CR>

" Previous/next quickfix file listings (e.g. search results)
"map <M-D-Down>  :cn<CR>
"map <M-D-Up>    :cp<CR>

" Previous/next buffers
"map <M-D-Left>  :bp<CR>
"map <M-D-Right> :bn<CR>

"indent/unindent visual mode selection with tab/shift+tab
vmap <tab> >gv
vmap <s-tab> <gv

" CtrlP
map <leader>f   :CtrlP<CR>

" ctags with rails load path
"map <leader>rt  :!rails runner 'puts $LOAD_PATH.join(" ")' \| xargs /usr/local/bin/ctags -R public/javascripts<CR>
"map <leader>T   :!rails runner 'puts $LOAD_PATH.join(" ")' \| xargs rdoc -f tags<CR>

" Git blame
map <leader>g   :Gblame<CR>

" Comment/uncomment lines
"map <leader>/   <plug>NERDCommenterToggle
"map <D-/>       <plug>NERDCommenterToggle
"imap <D-/>      <Esc><plug>NERDCommenterToggle i

" Copy current file path to system pasteboard
"map <silent> <D-C> :let @* = expand("%")<CR>:echo "Copied: ".expand("%")<CR>
"map <leader>C :let @* = expand("%").":".line(".")<CR>:echo "Copied: ".expand("%").":".line(".")<CR>

" Disable middle mouse button, F1
map <F1>            <Nop>
imap <F1>           <Nop>

" Easy access to the shell
map <Leader><Leader> :!

" Recalculate diff when it gets messed up.
nmap du :diffupdate<CR>

" Gundo.vim
map <leader>u :GundoToggle<CR>

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
