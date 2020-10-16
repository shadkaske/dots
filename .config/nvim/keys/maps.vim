" Insert Mode Maps
inoremap jk <Esc>
inoremap kj <Esc>
inoremap jj <ESC>
inoremap :w <ESC>:w<CR>
inoremap :wq <ESC>:wq<CR>
" Trigger autocomplete
inoremap <C-space> <C-x><C-f>
inoremap kk <C-O>o

" Colons
inoremap;; <C-o>A;
inoremap <M-;> <C-o>A;<ESC>o
nnoremap <C-;> A;<ESC>

" Visual Mode Maps
" Move selected line / block of text in visual mode
" shift + k to move up
" shift + j to move down
xnoremap K :move '<-2<CR>gv-gv
xnoremap J :move '>+1<CR>gv-gv
" Search Shortcuts
vnoremap // y/<C-R>"<CR>

" Normal Mode Maps
" Alternate way to save
nnoremap <silent> <C-s> :w<CR>
" Alternate way to quit
nnoremap <silent> <C-Q> :wq!<CR>
" Use control-c instead of escape
nnoremap <silent> <C-c> <Esc>
" Use Control q to close window
nnoremap <silent> <C-q> <C-w>q
" TAB in general mode will move to text buffer
nnoremap <silent> <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <silent> <S-TAB> :bprevious<CR>
" Use alt + hjkl to resize windows
nnoremap <silent> <M-j>    :resize -2<CR>
nnoremap <silent> <M-k>    :resize +2<CR>
nnoremap <silent> <M-h>    :vertical resize -2<CR>
nnoremap <silent> <M-l>    :vertical resize +2<CR>
" Turn off exmode and macro recording
nnoremap Q <nop>
" Add Lines above and below and exit insert
nnoremap ]o o<Esc>
nnoremap [o O<Esc>

" Terminal Key Maps
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>
tnoremap <C-q> <C-\><C-n><C-w>q

" Command Mode Maps
" Write with sudo tee
cmap w!! w !sudo tee %
