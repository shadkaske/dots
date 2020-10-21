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
source $HOME/.config/nvim/editor-config/autocmd.vim
source $HOME/.config/nvim/editor-config/syntax.vim
source $HOME/.config/nvim/editor-config/theme.vim

" Load Plugin Settings
source $HOME/.config/nvim/plugin-config/airline.vim
source $HOME/.config/nvim/plugin-config/tmuxline.vim
source $HOME/.config/nvim/plugin-config/vim-test.vim
source $HOME/.config/nvim/plugin-config/gitgutter.vim
source $HOME/.config/nvim/plugin-config/sneak.vim
" source $HOME/.config/nvim/plugin-config/easymotion.vim
source $HOME/.config/nvim/plugin-config/emmet.vim
source $HOME/.config/nvim/plugin-config/floatterm.vim
source $HOME/.config/nvim/plugin-config/vdebug.vim
source $HOME/.config/nvim/plugin-config/coc.vim
source $HOME/.config/nvim/plugin-config/fzf.vim
source $HOME/.config/nvim/plugin-config/fugitive.vim
source $HOME/.config/nvim/plugin-config/farr.vim

" Keymaps
source $HOME/.config/nvim/keys/maps.vim
source $HOME/.config/nvim/keys/which-key.vim
