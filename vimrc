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


call pathogen#helptags()
call pathogen#incubate()

set nocompatible
set rtp+=/usr/lib/go/misc/vim
filetype plugin indent on
syntax on                       " Highlight known syntaxes

" Source initialization files
" ---------------------------
runtime! init/**.vim

" Machine-local vim settings - keep this at the end
" --------------------------
silent! source ~/.vimrc.local

"autocmd BufEnter * :syntax sync fromstart
colorscheme solarized
set background=dark
set guifont=Source\ Code\ Pro\ 10
if !has('gui_running')
  set t_Co=16
endif

set novisualbell
set cursorcolumn
set cursorline
"hi CursorLine cterm=NONE ctermbg=grey " when using a light bg in console
set foldmethod=syntax

au BufRead,BufNewFile *.go set filetype=go
