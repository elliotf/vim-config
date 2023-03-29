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

"runtime! init/ack.vim
"runtime! init/colorscheme.vim
"runtime! init/fugitive.vim
"runtime! init/gundo.vim
"runtime! init/keybindings.vim
"runtime! init/language.vim
"
"runtime! init/nerd_commenter.vim
"runtime! init/nerd_tree.vim
"
"runtime! init/tabline.vim
"runtime! init/terminal.vim
"runtime! init/vim-spec.vim
"
"runtime! init/run_tests.vim
"
"" offending file that causes ESC to not make INSERT mode go away until another
"" key is pressed
"runtime! init/options.vim



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

set t_Co=256

colorscheme monokai_lumpy

"let g:jsbeautify = {'indent_size': 2, 'indent_char': ' '}
"autocmd FileType javascript nmap <leader>= :call JsBeautify()<CR>
"set guifont=Monospace

set cursorcolumn
set cursorline
hi CursorLine cterm=NONE ctermbg=238
hi CursorColumn cterm=NONE ctermbg=238

"set foldmethod=syntax
set foldmethod=indent
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
" map <ESC>[1;5C <C-Right>
" map <ESC>[1;5D <C-Left>
" map! <ESC>[1;5C <C-Right>
" map! <ESC>[1;5D <C-Left>

set fileformat=unix

set updatetime=250

augroup autoformat_settings
  "autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
augroup END

" augroup ft_rb
"   au!
"   " fix the SLOOOW syntax highlighting
"   au FileType ruby setlocal re=1
" augroup END

let g:codefmt_clang_format_style = 'Google'

set nolist
set ignorecase
let g:ctrlp_max_files = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  'node_modules\|dist$',
  \ }

set diffopt=vertical

let g:lasttab = 1
nmap <Leader>f :ALEFix<CR>
nmap <Leader>t :exe "tabn ".g:lasttab<CR>
nnoremap ``    :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" use a more readable color for Linter warnings/errors than the default bright
" orange
"highlight ALEError ctermbg=160 ctermfg=234
"highlight ALEWarning ctermbg=166 ctermfg=234
highlight ALEError ctermbg=none cterm=underline ctermfg=208
highlight ALEWarning ctermbg=none cterm=underline ctermfg=208
let g:ale_echo_msg_format = '%linter% says %s'
"\   'typescript': [ 'tslint', 'eslint', 'tsserver' ],
let g:ale_linters = {
\   'javascript': [ 'eslint' ],
\}
"\   'typescript': [ 'tslint', 'eslint' ],
let g:ale_fixers = {
\   'javascript': [ 'eslint' ],
\}

let g:gitgutter_max_signs = 2000

" security.  :(
set modelines=0
set nomodeline

" quickly zoom splits in/out from https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40
noremap <Leader>z <c-w>_ \| <c-w>\|

if executable('rg')
  set grepprg=rg\ --color=never
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" adapted from https://www.freecodecamp.org/news/how-to-search-project-wide-vim-ripgrep-ack/ with a fallback to ag for transition
"ack.vim --- {{{

" Use ripgrep for searching ⚡️
" Options include:
" --vimgrep -> Needed to parse the rg response properly for ack.vim
" --type-not sql -> Avoid huge sql file dumps as it slows down the search
" --smart-case -> Search case insensitive if all lowercase pattern, Search case sensitively otherwise
if executable('rg')
  let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" Auto close the Quickfix list after pressing '<enter>' on a list item
"let g:ack_autoclose = 1
let g:ack_autoclose = 0

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
"nnoremap <Leader>/ :Ack!<Space>
"nmap <leader>d :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>" Ack
" }}}

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

"  \  'javascript': {
"  \    'command': 'typescript-language-server --stdio',
"  \    'log_level': -1,
"  \    'suppress_stderr': v:true,
"  \  }
let g:lsc_server_commands = {
 \  'ruby': {
 \    'command': 'solargraph stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \}
let g:lsc_auto_map = {
 \  'GoToDefinitionSplit': 'gd',
 \  'FindReferences': 'gr',
 \  'Rename': 'gR',
 \  'ShowHover': 'K',
 \  'FindCodeActions': 'ga',
 \}
" \  'GoToDefinition': 'gd',
" \  'Completion': 'omnifunc',

"augroup my_lsc
"  au!
"  au BufNewFile,BufReadPost *
"    \  if has_key(g:lsc_servers_by_filetype, &filetype) && lsc#server#filetypeActive(&filetype)
"    \|     nnoremap <buffer> <C-w>]     :tab LSClientGoToDefinitionSplit<CR>
"    \|     nnoremap <buffer> <C-w><C-]> :tab LSClientGoToDefinitionSplit<CR>
"    \| endif
"augroup end

"let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_autocomplete  = v:false
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
