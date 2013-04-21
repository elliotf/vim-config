
" Default to collapsing everything
autocmd BufRead,BufNewFile *.js set foldlevel=0

" node.js routes
autocmd BufRead,BufNewFile */routes/*.js normal zR

" Mocha (javscript) spec files
autocmd BufRead,BufNewFile */test/*.js set foldlevel=1

" Client-side assets
autocmd BufRead,BufNewFile */js/*.js set foldlevel=1

