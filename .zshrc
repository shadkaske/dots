# Make sure oh-my-zsh is installed
[ ! -d $HOME/.oh-my-zsh ] && git clone https://github.com/robbyrussell/oh-my-zsh.git \
    $HOME/.oh-my-zsh

# Make sure fzf is installed
[ ! -d $HOME/.fzf ] && git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    $HOME/.fzf/install --no-fish --all

# Check if the PowerLevel10k Plugin is install
[ ! -d $HOME/.oh-my-zsh/custom/themes/powerlevel10k ] && git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    $HOME/.oh-my-zsh/custom/themes/powerlevel10k

# Check if the Autosuggestions Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions ] && git clone https://github.com/zsh-users/zsh-autosuggestions \
    $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions

# Check if the Syntax Highlight Plugin is installed
[ ! -d $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting ] && git clone https://github.com/zsh-users/zsh-syntax-highlighting.git \
    $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting

# Check if Base16-Shell is Installed
[ ! -d $HOME/.config/base16-shell ] && git clone https://github.com/chriskempson/base16-shell.git \
    $HOME/.config/base16-shell

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# Set default color scheme if base16-shell link is missing
[ ! -f $HOME/.base16_theme ] && base16_helios

HYPHEN_INSENSITIVE="true"

COMPLETION_WAITING_DOTS="true"

plugins=(
    zsh-syntax-highlighting
    zsh-autosuggestions
    git
    git-flow
    ubuntu
    archlinux
    tmux
    tmuxinator
    sudo
    systemd
    composer
    laravel
    laravel5
    vagrant
    common-aliases
    vi-mode
)

# User configuration

# Set ENV Variable for Artisan plugin
export ARTISAN_OPEN_ON_MAKE=nvim

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='nvim'
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='vi'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias zr="source ~/.zshrc"
alias minicom="minicom -c on"
alias tinker="php artisan tinker"
alias phu="vendor/bin/phpunit"
alias phuf="vendor/bin/phpunit --filter "
alias tt='tmux new-session -A -s Terms'
alias tp='tmuxinator start printApp-Homestead'
alias nivm='nvim'
alias eixt='exit'
alias cl="cal -B 1 -A 1"
alias xoff='sudo phpdismod -s cli xdebug'
alias xon='sudo phpenmod -s cli xdebug'

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.local/bin/pip:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export PATH=$HOME/.composer/vendor/bin:$PATH
export PATH=vendor/bin:$PATH

# Term Setting
export TERM="xterm-256color"

# AskPass Helper
export SUDO_ASKPASS='/usr/bin/ssh-askpass'

# NVM
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Gem Loacl path
if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Vi Mode Cursor change
function zle-keymap-select zle-line-init
{
    # change cursor shape in iTerm2
    case $KEYMAP in
        vicmd)      print -n --  '\033[1 q';;  # block cursor
        viins|main) print -n -- '\033[5 q';;  # line cursor
    esac

    zle reset-prompt
    zle -R
}

function zle-line-finish
{
    print -n -- '\033[1 q'  # block cursor
}

zle -N zle-line-init
zle -N zle-line-finish
zle -N zle-keymap-select

# Custom Keybinds

# Remap up and down are history search
bindkey '^[[A' up-line-or-search
bindkey '^[[B' down-line-or-search

# Ctrl Space to accept autosuggestions
bindkey '^ ' autosuggest-accept

# Custom functions

function homestead() {
    ( cd ~/.config/homestead && vagrant $* )
}

function kkssh() {
    ( kitty +kitten ssh $1 && ssh $1 )
}

function dots {
   /usr/bin/git --git-dir=$HOME/.dots/ --work-tree=$HOME $@
}

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# alias dots='git --git-dir=$HOME/.dots --work-tree=$HOME'
alias tn='tmux new-session -A -s'

# Fix for systemd unit file completion
_systemctl_unit_state() {
  typeset -gA _sys_unit_state
  _sys_unit_state=( $(__systemctl list-unit-files "$PREFIX*" | awk '{print $1, $2}') ) }
export PATH=~/.npm-global/bin:$PATH
alias lzg=lazygit
