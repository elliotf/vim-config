" ----------
" Vim Config
" ----------
" "
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
call pathogen#infect()

set nocompatible                " Don't maintain compatibility with vi
syntax on                       " Highlight known syntaxes
filetype plugin indent on

" Source initialization files
" ---------------------------

runtime! init/**.vim


" Machine-local vim settings - keep this at the end
" --------------------------
silent! source ~/.vimrc.local


"set mouse-=a
"let g:solarized_termcolors=16
  "colorscheme solarized
  "set background=dark
set guifont=Cascadia\ Code 

" if $COLORTERM == 'gnome-terminal'
"  set t_Co=256
" endif

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
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}

let g:ale_echo_msg_format = '%linter% says %s'
let g:ale_linters = {
\   'javascript': [ 'eslint' ],
\   'typescript': [ 'tslint', 'eslint', 'tsserver' ],
\   'jsx': ['eslint'],
\   'javascriptreact': ['eslint'],
\}
let g:ale_fixers = {
\   'javascript': [ 'eslint' ],
\   'typescript': [ 'tslint', 'eslint' ],
\   'jsx': ['eslint'],
\   'javascriptreact': ['eslint'],
\}

let g:gitgutter_max_signs = 2000

" security.  :(
set modelines=0
set nomodeline

""""""""""""""""""""
" larry
let g:prettier#autoformat = 0
set relativenumber

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
command! -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nmap <leader>d :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Ack
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
cabbrev Ack Ack!
let g:vim_jsx_pretty_colorful_config = 1
autocmd BufNewFile,BufRead *.md set syntax=markdown

" make colors work
if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" choose a color
syntax enable
set background=dark
colorscheme gruvbox
"colorscheme palenight
"colorscheme one
"colorscheme brogrammer
"colorscheme space-vim-dark
"colorscheme github
"colorscheme lucario
"colorscheme ayu
"colorscheme OceanicNext
"colorscheme darkblue
"colorscheme flattened_dark

"set background=light
"colorscheme base16-gruvbox-light-hard
"colorscheme lightning
"colorscheme flattened_light

" hack for jsx highlighting
au BufNewFile,BufRead *.jsx setlocal ft=html ft=javascript ft=javascriptreact

let g:github_enterprise_urls = ['https://github.shuttercorp.net']
