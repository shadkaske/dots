
" set colorcolumn=100
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

" Treat dashes as part of word object
set iskeyword+=-

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

