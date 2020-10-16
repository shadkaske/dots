" AutoCmd Settings

autocmd FileType php,html setlocal ts=4 sts=4 sw=4 expandtab
autocmd FileType javascript,css setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType vim let b:coc_pairs_disabled = ['"']
autocmd FileType sh setlocal ts=4 sts=4 sw=4 expandtab colorcolumn=80

autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab

" Emmet Install for these filetypes
" autocmd BufNewFile,BufRead *.blade.php EmmetInstall
" autocmd FileType blade EmmetInstall

autocmd! BufWritePost $MYVIMRC source $MYVIMRC

autocmd BufWritePost *.php Format

" Autosave / Autoload Folds
" augroup AutoSaveFolds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent loadview
" augroup END

