" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
              if file =~ '\/.'
                let file = substitute(file, '.*\/\ze.', '', '')
              endif
            else
              let file = pathshorten(bufname(bufnr))
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif

" set showtabline=1  " 1 to show tabline only when more than one tab is present
" set tabline=%!MyTabLine()  " custom tab pages line
" function! MyTabLine() " acclamation to avoid conflict
"   let s = '' " complete tabline goes here
"   " loop through each tab page
"   for t in range(tabpagenr('$'))
"     " set highlight
"     if t + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"     " set the tab page number (for mouse clicks)
"     let s .= '%' . (t + 1) . 'T'
"     let s .= ' '
"     " set page number string
"     let s .= t + 1 . ' '
"     " get buffer names and statuses
"     let n = ''      "temp string for buffer names while we loop and check buftype
"     let m = 0       " &modified counter
"     " let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
"     " loop through each buffer in a tab
" 
"     " for b in tabpagebuflist(t + 1)
"     "   " buffer types: quickfix gets a [Q], help gets [H]{base fname}
"     "   " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
"     "   if getbufvar( b, "&buftype" ) == 'help'
"     "     let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
"     "   elseif getbufvar( b, "&buftype" ) == 'quickfix'
"     "     let n .= '[Q]'
"     "   else
"     "     let n .= pathshorten(bufname(b))
"     "   endif
"     "   " check and ++ tab's &modified count
"     "   if getbufvar( b, "&modified" )
"     "     let m += 1
"     "   endif
"     "   " no final ' ' added...formatting looks better done later
"     "   if bc > 1
"     "     let n .= ' '
"     "   endif
"     "   let bc -= 1
"     " endfor
"     " add modified label [n+] where n pages in tab are modified
"     if m > 0
"       let s .= '[' . m . '+]'
"     endif
"     " select the highlighting for the buffer names
"     " my default highlighting only underlines the active tab
"     " buffer names.
"     if t + 1 == tabpagenr()
"       let s .= '%#TabLineSel#'
"     else
"       let s .= '%#TabLine#'
"     endif
"     " add buffer names
"     if n == ''
"       let s.= '[New]'
"     else
"       let s .= n
"     endif
"     " switch to no underlining and add final space to buffer list
"     let s .= ' '
"   endfor
"   " after the last tab fill with TabLineFill and reset tab page nr
"   let s .= '%#TabLineFill#%T'
"   " right-align the label to close the current tab page
"   if tabpagenr('$') > 1
"     let s .= '%=%#TabLineFill#%999Xclose'
"   endif
"   return s
" endfunction
