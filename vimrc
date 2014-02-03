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


"set background=dark
set background=light
"set mouse-=a
"let g:solarized_termcolors=16
if has('gui_running')
  colorscheme solarized
  set background=dark
endif

if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

"let g:jsbeautify = {'indent_size': 2, 'indent_char': ' '}
"autocmd FileType javascript nmap <leader>= :call JsBeautify()<CR>
"set guifont=Monospace
set guifont=Source\ Code\ Pro\ 9

set cursorcolumn
set cursorline
hi CursorLine cterm=NONE ctermbg=grey

"set foldlevel=3
"set foldnestmax=2
"augroup vimrc
"  au BufReadPre * setlocal foldmethod=indent
"  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
"augroup END

set novisualbell
"set t_vb=

" tab navigation like firefox
nnoremap <C-S-tab> :tabprevious<CR>
nnoremap <C-tab>   :tabnext<CR>
nnoremap <C-t>     :tabnew<CR>
inoremap <C-S-tab> <Esc>:tabprevious<CR>i
inoremap <C-tab>   <Esc>:tabnext<CR>i
inoremap <C-t>     <Esc>:tabnew<CR>

set fileformat=unix
