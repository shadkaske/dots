" GitGutter
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" Gitgutter Keymaps
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" Gitgutter Stage / Undo
" nmap <leader>ga <Plug>(GitGutterStageHunk)
" nmap <leader>gu <Plug>(GitGutterUndoHunk)

" Gitgutter Preview
" nmap <leader>gh <Plug>(GitGutterPreviewHunk)
