" ----------
" Vim Config
" ----------
"
"
" How this works:
"
" This file is minimal.  Most of the vim settings and initialization is in
" several files in .vim/init.  This makes it easier to find things and to
" merge between branches and repos.
"
" Please do not add configuration to this file, unless it *really* needs to
" come first or last, like Pathogen and sourcing the machine-local config.
" Instead, add it to one of the files in .vim/init, or create a new one.


" Pathogen (This must happen first.)
" --------

filetype off                    " Avoid a Vim/Pathogen bug
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible                " Don't maintain compatibility with vi
syntax on                       " Highlight known syntaxes
filetype plugin indent on


" Source initialization files
" ---------------------------

runtime! init/**.vim


" Machine-local vim settings - keep this at the end
" --------------------------
silent! source ~/.vimrc.local


set background=dark
"set background=light
"set mouse-=a
"let g:solarized_termcolors=16
if has('gui_running')
  "colorscheme solarized
  "set background=dark
  set guifont=Source\ Code\ Pro\ 9
endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

colorscheme monokai_lumpy

"let g:jsbeautify = {'indent_size': 2, 'indent_char': ' '}
"autocmd FileType javascript nmap <leader>= :call JsBeautify()<CR>
"set guifont=Monospace

set cursorcolumn
set cursorline
hi CursorLine cterm=NONE ctermbg=238
hi CursorColumn cterm=NONE ctermbg=238

set foldmethod=syntax
set foldlevelstart=100

set novisualbell
"set t_vb=

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>
map <ESC>[1;5C <C-Right>
map <ESC>[1;5D <C-Left>
map! <ESC>[1;5C <C-Right>
map! <ESC>[1;5D <C-Left>

set fileformat=unix

set updatetime=250

augroup autoformat_settings
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
augroup END

let g:codefmt_clang_format_style = 'Google'

set nolist
set ignorecase
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|dist$',
  \ }

set diffopt+=vertical

let g:lasttab = 1
nmap <Leader>f :ALEFix<CR>
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
nnoremap ``    :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" use a more readable color for Linter warnings/errors than the default bright
" orange
highlight ALEError ctermbg=160 ctermfg=234
highlight ALEWarning ctermbg=166 ctermfg=234
let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_linters = {
\   'javascript': [ 'eslint' ],
\   'typescript': [ 'eslint', 'tsserver' ],
\}
let g:ale_fixers = {
\   'javascript': [ 'eslint' ],
\   'typescript': [ 'eslint' ],
\}

let g:gitgutter_max_signs = 2000

" security.  :(
set modelines=0
set nomodeline
