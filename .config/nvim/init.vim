"   Author: Shad Kaske
"   Repo: https://github.com/shadkaske/dotfiles
"
" Plugins
source ~/.config/nvim/plugins.vim

" Color / UI Settings ------------------------------------------------------{{{
if (has('termguicolors'))
  set termguicolors
endif

" Theme
" if filereadable(expand('~/.vimrc_background'))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif
colorscheme material

set colorcolumn=100

" Airline Settings
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
" let g:airline_left_sep = ''
" let g:airline_left_alt_sep = ''
" let g:airline_right_sep = ''
" let g:airline_right_alt_sep = ''

" Tmux Line
" let g:tmuxline_separators = {
"       \ 'left' : '',
"       \ 'left_alt': ')',
"       \ 'right' : '',
"       \ 'right_alt' : '(',
"       \ 'space' : ' '}

" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_status_justify = 'left'

  let g:tmuxline_preset = {
        \'a'    : '#S',
        \'b'    : '#W',
        \'win'  : ['#I', '#W'],
        \'cwin' : ['#I', '#W'],
        \'x'    : '%a',
        \'y'    : '%R',
        \'z'    : '#H'}


" }}}

" Folding, it's complicated ------------------------------------------------{{{

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

"}}}

" Editor Options -----------------------------------------------------------{{{

" Command Bits
" set noshowcmd
set noshowmode
set hidden
set cmdheight=1
set title
set scrolloff=3
set shell=$SHELL
set laststatus=2
set timeoutlen=500

" Split Settings
set splitbelow
set splitright

" Use System Clipboard
" set clipboard=unnamedplus

" Tab Settings
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set shiftround

" Show Relative Line Numbers
set number
set relativenumber

" Don't Wrap Long Lines
set nowrap

" Completion Clean Up
set shortmess+=c

" Turn off autocomments
set formatoptions-=cro

" Mouse that evil bastard
if has('mouse')
  set mouse=a
endif

" Searching
set wildmenu
set wildmode=full
set wildignore+=*.a,*.o,*.bmp,*.gif,*.ico,*.jpg,*.png,.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.swp,*.tmp,*/tmp/*,*.so,*.swp,*.zip,*/.git/,*/storage/
set wildignorecase

if has('nvim')
  set wildoptions=pum
endif

set ignorecase
set smartcase
set hlsearch
set incsearch
set nolazyredraw

" Turn off Dinging Noises
set noerrorbells
set visualbell

" Turn off backup files
set nobackup
set nowritebackup

" Turn on autoindent
set autoindent
set smartindent

" Set short update time for async processes
set updatetime=300

" Set Sign Column To Always Show
set signcolumn=yes

" Set list characters
set listchars=tab:‣\ ,trail:·,precedes:«,extends:»,eol:¬

"}}}

" Plugin Settings ----------------------------------------------------------{{{

" VimTest
let test#strategy = 'dispatch'

" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'

" let g:sneak#label = 1

" Emmet Settings
let g:user_emmet_settings = {
            \  'php' : {
            \    'extends' : 'html',
            \    'filters' : 'c',
            \  },
            \  'blade' : {
            \    'extends' : 'html',
            \    'filters' : 'c',
            \  },
            \  'html' : {
            \    'comment_type': 'none',
            \  },
            \ }

" Float Term setting
let g:floaterm_autoclose = 2
let g:floatterm_wintype = 'normal'
let g:floatterm_position = 'bottom'

" VDebug
hi default DbgBreakptLine term=reverse ctermfg=Black ctermbg=Cyan guifg=#4A4A4A guibg=#89DDFF
hi default DbgBreakptSign term=reverse ctermfg=White ctermbg=Red guifg=#ffffff guibg=#F07178

"}}}

" COC Settings -------------------------------------------------------------{{{

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"
" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Explorer Settings
let g:coc_explorer_global_presets = {
    \ 'explorer.icon.enableVimDevicons': 'true'
  \ }

"}}}

" Keymap Settings ----------------------------------------------------------{{{

" Set Leader key to space
let g:mapleader=' '

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
nma <silent> <leader>b :Buffers<CR>
nma <silent> <leader>p :Files<CR>
nnoremap <silent> <C-p> :GFiles<CR>

" Remove file names from Ag searches
command! -bang -nargs=* Ag call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Popup Layout
" Reverse the layout to make the FZF list top-down
let $FZF_DEFAULT_OPTS='--layout=reverse'
let $FZF_DEFAULT_OPTS.=' --border --margin=0,2'

" Using the custom window creation function
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" Function to create the custom floating window
function! FloatingFZF()
    " creates a scratch, unlisted, new, empty, unnamed buffer
    " to be used in the floating window
    let buf = nvim_create_buf(v:false, v:true)

    " 30% of the height
    let height = float2nr(&lines * 0.3)
    " 60% of the height
    let width = float2nr(&columns * 0.4)
    " horizontal position (centralized)
    let horizontal = float2nr((&columns - width) / 2)
    " vertical position (one line down of the top)
    let vertical = 0

    " Pass the options we created and strip styling
    let opts = {
                \ 'relative': 'editor',
                \ 'row': vertical,
                \ 'col': horizontal,
                \ 'width': width,
                \ 'height': height,
                \ 'style': 'minimal'
                \ }

    " open the new window, floating, and enter to it
    call nvim_open_win(buf, v:true, opts)
endfunction

" Fugitive Shortcuts
nmap <silent><leader>gs :Gstatus<CR>

" Search Shortcuts
vnoremap // y/<C-R>"<CR>
nmap <silent> <leader>f :Ag<CR>

" Add Lines above and below and exit insert
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>

" Toggle List Chars
nnoremap <silent> <leader>L :set list!<cr>

" Reload Config
nnoremap <silent> <leader>r :source $MYVIMRC<cr>

" Buffer Manipulations
nnoremap <silent> <leader>d :Bdelete<CR>
nnoremap <silent> <leader>D :Bdelete!<CR>
nnoremap <silent> <leader>l :bnext<CR>
nnoremap <silent> <leader>h :bprevious<CR>

" Open Splits
nnoremap <leader>wv <C-w>v
nnoremap <leader>ws <C-w>s

" Manipulate Split Size
" Height
nnoremap <leader>wh <C-w>_
" Width
nnoremap <leader>wj <C-w>|
" Normalize
nnoremap <leader>w= <C-w>=

" Close Splits / Tabs
nnorema <silent> <leader>c :close<CR>
nnorema <silent> <leader>q :quit<CR>

" Turn off Search Highlights
nnoremap <silent><leader>. :nohlsearch<cr>

" Trigger autocomplete
inoremap <C-space> <C-x><C-f>

" Trim Whitespace
nnoremap <silent> <leader>S :StripWhitespace<CR>

" NERDTree
nmap <silent> <leader>e :CocCommand explorer --toggle<cr>
" nmap <silent> <leader>y :NERDTreeFind<cr>

" // in visual mode will start a search with the current selection
vnoremap // y/<C-R>"<CR>"

" Add semicolon to end of the line
" Insert Mode first, normaly mode second
inoremap;; <C-o>A;
inoremap <M-;> <C-o>A;<ESC>o
nnoremap <leader>; A;<ESC>

imap kk <C-O>o

" Vim Test Shortcuts
nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
nmap <silent> <leader>tg :TestVisit<CR>

" Gitgutter Keymaps
nmap ]g <Plug>(GitGutterNextHunk)
nmap [g <Plug>(GitGutterPrevHunk)

" Gitgutter Stage / Undo
nmap <leader>ga <Plug>(GitGutterStageHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)

" Gitgutter Preview
nmap <leader>gh <Plug>(GitGutterPreviewHunk)

" Turn on my fold method
nmap <silent> <leader>mf :setlocal foldmethod=marker foldtext=MyFoldText()<CR>

" Emmet Expand Snippet
imap ,, <Plug>(emmet-expand-abbr)

" Float Term
let g:floaterm_keymap_new    = '<Leader>to'
let g:floaterm_keymap_prev   = '<Leader>tp'
let g:floaterm_keymap_next   = '<Leader>tn'
let g:floaterm_keymap_toggle = '<Leader>tt'
let g:floaterm_keymap_kill   = '<Leader>tc'

"}}}

" AutoCmd Settings ---------------------------------------------------------{{{

autocmd FileType php,html setlocal ts=4 sts=4 sw=4 expandtab colorcolumn=100
autocmd FileType javascript,css setlocal ts=2 sts=2 sw=2 expandtab
      \ colorcolumn=100
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

"}}}

" Syntax Settings ----------------------------------------------------------{{{

function! PhpSyntaxOverride()
  " Put snippet overrides in this function.
  hi! link phpDocTags phpDefine
  hi! link phpDocParam phpType
endfunction

augroup phpSyntaxOverride
  autocmd!
  autocmd FileType php call PhpSyntaxOverride()
augroup END

let python_highlight_all=1

" Match Tags Always
let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'blade' : 1,
    \}

"}}}
