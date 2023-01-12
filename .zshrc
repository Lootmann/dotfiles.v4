##########
# .zshrc
##########

#######
# zsh
#######

# prompt (pure)
fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

# completion
autoload -Uz compinit && compinit

# search
setopt auto_cd
setopt auto_list
setopt auto_menu
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

# history
export LANG=ja_JP.UTF-8
setopt share_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# dont keep wrong command
zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# LS_COLORS from https://github.com/trapd00r/LS_COLORS
source ~/.local/share/lscolors.sh


###########
# plugins
###########

# fzf
export FZF_DEFAULT_OPTS='--height 80% --reverse --border'

function fzf_history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "$LBUFFER" --prompt="History > ")
  CURSOR=$#BUFFER
  zle reset-prompt;
  zle redisplay
}
zle -N fzf_history
bindkey '^R' fzf_history

# auto suggestiongs
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# syntax highlighting
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[line]='none'
ZSH_HIGHLIGHT_STYLES[globbing]='none'

zshaddhistory() { whence ${${(z)1}[1]} >| /dev/null || return 1 }

# zsh-hist
# source ~/.zsh/zsh-hist/zsh-hist.plugin.zsh
# don't save fail command
# delete-failed-history() {
#   (( ? )) &&
#     hist -s d -1
# }
# autoload -Uz add-zsh-hook
# add-zsh-hook precmd delete-failed-history



#########
# alias
#########
alias c="clear"
alias cls="clear;ls"

alias b="cd ../"
alias bb="cd ../../"
alias bbb="cd ../../../"
alias bbbb="cd ../../../../"
alias bbbbb="cd ../../../../../"

alias ls="ls --color=auto"
alias l="ls"
alias sl="ls"
alias ll="ls -la"

# docker
alias d="docker"
alias dc="docker compose"

# Coldark-Cold # too dark
# Monokai Extended Light # lil dark
# Dracula
# Github
# gruvbox-dark
# Monokai Extended
# Monokai Extended Origin
# OneHalfDark
# Solarized (dark)
# Visual Studio Dark+
export BAT_THEME="gruvbox-dark"
alias cat="bat"

alias v="nvim"
alias nv="nvim"
alias vn="nvim"
alias m="make"
alias mkae="make"
alias t="touch"
alias py="python3"

# mkdir and cd
function mkcd() {
  mkdir $1 && cd $1
}

alias pbcopy='xclip -selection clipboard'

function copy() {
  cat $1 | pbcopy
}

# git
alias ga="git add ."
alias gc="git commit"
alias gcm="git commit -m"
alias gb="git branch"
alias gba="git branch -a"
alias gbv="git branch -vva"

alias gda="git diff --cached"
alias gdh="git diff HEAD"
alias gg="git log --graph --pretty=format:'%x09%C(auto) %h %Cgreen %ar %Creset%x09by\"%C(cyan ul)%an%Creset\" %x09%C(auto)%s %d'"
alias glo="git log --oneline"
alias gs="git status -uall"
alias gsi="git status --ignored"
alias gp="git push"
alias gpm="git push origin main"
alias gap="git add -p"


########
# path
########

# bin
export PATH="$PATH:$HOME/.local/bin"

# rust
source "$HOME/.cargo/env"

# go
export PATH=$PATH:/usr/local/go/bin

# alacritty
fpath+=${ZDOTDIR:-~}/.zsh_functions
