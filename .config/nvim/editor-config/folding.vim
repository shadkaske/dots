" Folding Configuration
let g:xml_syntax_folding = 1

function! MyFoldText() " {{{
  let line = getline(v:foldstart)
  let nucolwidth = &fdc + &number * &numberwidth
  let windowwidth = winwidth(0) - nucolwidth - 3
  let foldedlinecount = v:foldend - v:foldstart

  " expand tabs into spaces
  let onetab = strpart('          ', 0, &tabstop)
  let line = substitute(line, '\t', onetab, 'g')

  let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
  " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines')
  " let fillcharcount = windowwidth - len(line) - len(foldedlinecount) - len('lines   ')
  let fillcharcount = windowwidth - len(line)
  " return line . '…' . repeat(' ',fillcharcount) . foldedlinecount . ' Lines'
  return line . ''. repeat(' ',fillcharcount)
endfunction " }}}

set foldmethod=manual

" autocmd InsertEnter * if !exists('w:last_fdm') |
"       \ let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
" autocmd InsertLeave,WinLeave * if exists('w:last_fdm') |
"       \ let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

" autocmd FileType vim setlocal fdc=1
set foldlevel=99

autocmd FileType vim setlocal foldmethod=marker foldtext=MyFoldText()
autocmd FileType vim setlocal foldlevel=0

autocmd FileType javascript,html,css,scss,typescript setlocal foldlevel=99

autocmd FileType css,scss,json setlocal foldmethod=marker
autocmd FileType css,scss,json setlocal foldmarker={,}

autocmd FileType xml setlocal foldmethod=syntax

autocmd FileType javascript,html setlocal foldmethod=syntax

" PHP Folding
" let g:php_folding=1
" let g:php_sync_method=-1

