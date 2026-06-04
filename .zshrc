export ZSH="$HOME/.oh-my-zsh"

export XDG_CONFIG_HOME="$HOME/.config"

export PATH="$HOME/.local/bin:$PATH"

export PATH="$HOME/go/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# ========================================================================================
# MacOS
# ========================================================================================
export PATH="/Applications/Godot.app/Contents/MacOS:$PATH"

export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/opt/libpq/bin:$PATH"
# ========================================================================================

# theme
ZSH_THEME="spaceship"
SPACESHIP_CHAR_SYMBOL="🚀 ››› "
SPACESHIP_TIME_SHOW=true

plugins=(
  autoupdate
  aptos # manual
  codex # manual
  zsh-claudecode-completion
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

source "$ZSH/oh-my-zsh.sh"

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
# generate omz completion plugins on first run
ensure_omz_completion() {
  local name=$1 cmd=$2
  local dir="$ZSH/custom/plugins/$name"
  [[ -d $dir ]] && return
  mkdir -p "$dir"
  eval "$cmd" > "$dir/$name.plugin.zsh"
}
ensure_omz_completion aptos "aptos config generate-shell-completions --shell zsh --output-file /dev/stdout"
ensure_omz_completion codex "codex completion zsh"
ensure_omz_completion pnpm  "pnpm completion zsh"

################################################################################
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

################################################################################
# update everything
update_devtools() {
  setopt local_options err_return

  brew upgrade
  brew update

  rustup update

  omz update
  upgrade_oh_my_zsh_custom

  claude update

  nvm install --lts

  # alacritty

  # nvim lazy + mason

  # tmux plugin update
}
