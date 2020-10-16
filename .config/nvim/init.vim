"   Author: Shad Kaske
"   Repo: https://github.com/shadkaske/dotfiles
"

" Set Leader key to space
let g:mapleader=' '

" Plugins
source $HOME/.config/nvim/plugins.vim

" Editor Settings
source $HOME/.config/nvim/editor-config/general.vim
source $HOME/.config/nvim/editor-config/folding.vim
source $HOME/.config/nvim/editor-config/theme.vim
source $HOME/.config/nvim/editor-config/autocmd.vim
source $HOME/.config/nvim/editor-config/syntax.vim

" Load Plugin Settings
source $HOME/.config/nvim/plugin-config/airline.vim
source $HOME/.config/nvim/plugin-config/tmuxline.vim
source $HOME/.config/nvim/plugin-config/vim-test.vim
source $HOME/.config/nvim/plugin-config/gitgutter.vim
source $HOME/.config/nvim/plugin-config/sneak.vim
source $HOME/.config/nvim/plugin-config/emmet.vim
source $HOME/.config/nvim/plugin-config/floatterm.vim
source $HOME/.config/nvim/plugin-config/vdebug.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/fzf.vim

" Keymaps
source $HOME/.config/nvim/keys/maps.vim
source $HOME/.config/nvim/keys/which-key.vim

" Keymap Settings
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>


" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()


" jj to esc in insert mode
inoremap jj <ESC>

" map :w to escape and write  in insert mode
inoremap :w <ESC>:w<CR>
inoremap :wq <ESC>:wq<CR>

" Turn off exmode and macro recording
nnoremap Q <nop>

" Write with sudo tee
cmap w!! w !sudo tee %

" FZF shorcuts
" nma <silent> <leader>b :Buffers<CR>
" nma <silent> <leader>p :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>


" Fugitive Shortcuts
" nmap <silent><leader>gs :Gstatus<CR>

" Search Shortcuts
vnoremap // y/<C-R>"<CR>
" nmap <silent> <leader>f :Ag<CR>

" Add Lines above and below and exit insert
nnoremap ]o o<Esc>
nnoremap [o O<Esc>

" Reload Config
" nnoremap <silent> <leader>r :source $MYVIMRC<cr>

" Buffer Manipulations
" nnoremap <silent> <leader>d :Bdelete<CR>
" nnoremap <silent> <leader>D :Bdelete!<CR>
" nnoremap <silent> <leader>l :bnext<CR>
" nnoremap <silent> <leader>h :bprevious<CR>

" Open Splits
" nnoremap <leader>wv <C-w>v
" nnoremap <leader>ws <C-w>s

" Manipulate Split Size
" Height
" nnoremap <leader>wh <C-w>_
" Width
" nnoremap <leader>wj <C-w>|
" Normalize
" nnoremap <leader>w= <C-w>=

" Close Splits / Tabs
" nnorema <silent> <leader>c :close<CR>
" nnorema <silent> <leader>q :quit<CR>

" Turn off Search Highlights
" nnoremap <silent><leader>. :nohlsearch<cr>

" Trigger autocomplete
inoremap <C-space> <C-x><C-f>

" Trim Whitespace
" nnoremap <silent> <leader>S :StripWhitespace<CR>

" NERDTree
" nmap <silent> <leader>e :CocCommand explorer --toggle<cr>
" nmap <silent> <leader>y :NERDTreeFind<cr>

" // in visual mode will start a search with the current selection
vnoremap // y/<C-R>"<CR>"

" Add semicolon to end of the line
" Insert Mode first, normaly mode second
inoremap;; <C-o>A;
inoremap <M-;> <C-o>A;<ESC>o
" nnoremap <leader>; A;<ESC>

imap kk <C-O>o

" Vim Test Shortcuts
" nmap <silent> <leader>tn :TestNearest<CR>
" nmap <silent> <leader>tf :TestFile<CR>
" nmap <silent> <leader>ts :TestSuite<CR>
" nmap <silent> <leader>tl :TestLast<CR>
" nmap <silent> <leader>tg :TestVisit<CR>

" Gitgutter Keymaps
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" Gitgutter Stage / Undo
" nmap <leader>ga <Plug>(GitGutterStageHunk)
" nmap <leader>gu <Plug>(GitGutterUndoHunk)

" Gitgutter Preview
" nmap <leader>gh <Plug>(GitGutterPreviewHunk)

" Turn on my fold method
" nmap <silent> <leader>mf :setlocal foldmethod=marker foldtext=MyFoldText()<CR>

" Emmet Expand Snippet
imap ,, <Plug>(emmet-expand-abbr)

" Float Term
" let g:floaterm_keymap_new    = '<Leader>to'
" let g:floaterm_keymap_prev   = '<Leader>tp'
" let g:floaterm_keymap_next   = '<Leader>tn'
" let g:floaterm_keymap_toggle = '<Leader>tt'
" let g:floaterm_keymap_kill   = '<Leader>tc'
