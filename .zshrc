export ZSH="$HOME/.oh-my-zsh"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# theme
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="🚀 ››› "
SPACESHIP_TIME_SHOW=true

plugins=(
  autoupdate
  fzf
  helm
  kops
  kubectl
  aws
  docker
  docker-compose
  nvm
  npm
  yarn
  git
  rust
  golang
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

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
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

################################################################################
# Autoupdate update zsh plugins
export UPDATE_ZSH_DAYS=3
