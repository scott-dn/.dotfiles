export ZSH="$HOME/.oh-my-zsh"

# theme
ZSH_THEME="spaceship"
SPACESHIP_CHAR_PREFIX=👻
SPACESHIP_CHAR_SUFFIX=" ››› "
SPACESHIP_CHAR_SYMBOL=""
SPACESHIP_TIME_SHOW=true

plugins=(helm kops kubectl aws docker docker-compose nvm npm git fzf golang zsh-completions zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias vi="nvim"
alias vim="nvim"
alias cat="bat"
alias l="exa -al"

alias lg="lazygit"

################################################################################
# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

################################################################################
# Autoupdate update zsh plugins
export UPDATE_ZSH_DAYS=13
ZSH_CUSTOM_AUTOUPDATE_QUIET=true

