" Plugins ------------------------------------------------------------------{{{

call plug#begin('~/.config/nvim/plugged')

" UI / Navigation
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] } |
      \ Plug 'Xuyuanp/nerdtree-git-plugin' | Plug 'ryanoasis/vim-devicons'
      \  | Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ntpeters/vim-better-whitespace'
Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'moll/vim-bbye'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chriskempson/base16-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'chrisbra/Colorizer'
Plug 'voldikss/vim-floaterm'
Plug 'vim-scripts/ReplaceWithRegister'
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"  Coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Snippets
Plug 'honza/vim-snippets'
" language
Plug 'shadkaske/vim-blade', { 'for': ['php', 'blade'] }
Plug 'Valloric/MatchTagAlways', {'for': ['php', 'html', 'blade']}
Plug 'StanAngeloff/php.vim', { 'for': ['php', 'html'] }
Plug 'vim-vdebug/vdebug'
Plug 'arnaud-lb/vim-php-namespace', {'for': 'php'}
Plug 'mattn/emmet-vim', { 'for': ['html', 'php', 'javascriptn', 'css']}
Plug 'othree/html5.vim', { 'for': ['html', 'php'] }
Plug 'pangloss/vim-javascript', { 'for': ['javascript','html', 'php'] }
Plug 'jelera/vim-javascript-syntax', { 'for': ['javascript','html', 'php'] }
Plug 'elzr/vim-json', { 'for': ['json', 'php'] }
Plug 'cakebaker/scss-syntax.vim', { 'for': 'scss' }
Plug 'hail2u/vim-css3-syntax', { 'for': ['javascript','html', 'php'] }
Plug 'mboughaba/i3config.vim'
Plug 'janko/vim-test'
Plug 'vim-python/python-syntax', { 'for': 'python'}
Plug 'chr4/nginx.vim'
" Plug 'cosminadrianpopescu/vim-sql-workbench'

call plug#end()

" Coc Extensions
let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-json',
      \ 'coc-tag',
      \ 'coc-pairs',
      \ 'coc-html',
      \ 'coc-css',
      \ 'coc-dictionary',
      \ 'coc-yaml',
      \ 'coc-python',
      \ 'coc-phpls',
      \ 'coc-ultisnips'
      \ ]

"}}}
