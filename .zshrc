export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"

# theme
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="🚀 ››› "
SPACESHIP_TIME_SHOW=true

plugins=(
  autoupdate
  aptos # manual
  codex # manual
  fzf
  helm
  kops
  kubectl
  aws
  docker
  docker-compose
  nvm
  npm
  pnpm
  yarn
  git
  rust
  golang
  zsh-completions
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

ZSH_HIGHLIGHT_STYLES[comment]='fg=#808080'

alias vi="nvim"
alias vim="nvim"
alias cat="bat"

alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'

alias lg="lazygit"

alias python="python3"

alias p="pnpm"

alias tf='terraform'
alias gd='Godot'

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
export UPDATE_ZSH_DAYS=5

################################################################################
# aptos auto complete
AUTO_COMPLETE_DIR="$HOME/.oh-my-zsh/custom/plugins/aptos"
if [ ! -d "$AUTO_COMPLETE_DIR" ]; then
  mkdir -p "$AUTO_COMPLETE_DIR"
  aptos config generate-shell-completions --shell zsh --output-file "$AUTO_COMPLETE_DIR/aptos.plugin.zsh" 1> /dev/null
fi
unset AUTO_COMPLETE_DIR

################################################################################
# codex auto complete
AUTO_COMPLETE_DIR="$HOME/.oh-my-zsh/custom/plugins/codex"
if [ ! -d "$AUTO_COMPLETE_DIR" ]; then
  mkdir -p "$AUTO_COMPLETE_DIR"
  codex completion zsh > "$AUTO_COMPLETE_DIR/codex.plugin.zsh"
fi
unset AUTO_COMPLETE_DIR

################################################################################
# pnpm auto complete
AUTO_COMPLETE_DIR="$HOME/.oh-my-zsh/custom/plugins/pnpm"
if [ ! -d "$AUTO_COMPLETE_DIR" ]; then
  mkdir -p "$AUTO_COMPLETE_DIR"
  pnpm completion zsh > "$AUTO_COMPLETE_DIR/pnpm.plugin.zsh"
fi
unset AUTO_COMPLETE_DIR

################################################################################
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
