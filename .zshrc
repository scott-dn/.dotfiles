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
  pnpm # manual
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
# $cmd writes to $out itself and its stdout is dropped: aptos prints a
# {"Result": "Success"} blob alongside the script, which zsh then tries to run.
# Bail out on a failed or empty run so a broken file isn't cached forever.
ensure_omz_completion() {
  local name=$1 cmd=$2
  local dir="$ZSH/custom/plugins/$name"
  local out="$dir/$name.plugin.zsh"
  [[ -d $dir ]] && return
  mkdir -p "$dir"
  eval "$cmd" >/dev/null && [[ -s $out ]] || rm -rf "$dir"
}
ensure_omz_completion aptos 'aptos config generate-shell-completions --shell zsh --output-file "$out"'
ensure_omz_completion codex 'codex completion zsh > "$out"'
ensure_omz_completion pnpm  'pnpm completion zsh > "$out"'

################################################################################
# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

################################################################################
# build & install alacritty from source
update_alacritty() {
  setopt local_options err_return
  local repo="$HOME/alacritty"

  [[ -d $repo/.git ]] || git clone --depth 1 https://github.com/alacritty/alacritty.git "$repo"
  git -C "$repo" fetch --depth 1 origin master && git -C "$repo" checkout -f FETCH_HEAD

  make -C "$repo" app
  cp -r $repo/target/release/osx/Alacritty.app /Applications/
}

################################################################################
# update nvim plugins (lazy) + lsp/formatter tools (mason)
update_nvim() {
  setopt local_options err_return

  # bang runs it synchronously, otherwise headless nvim quits mid-sync
  nvim --headless "+Lazy! sync" +qa

  # :MasonUpdate only refreshes the registry index, so diff installed against
  # latest ourselves and pick up anything in chadrc's mason.pkgs that's missing.
  # :MasonInstall blocks and exits non-zero on failure when headless.
  nvim --headless -c MasonUpdate -c 'lua
    local reg = require "mason-registry"
    local todo = {}
    for _, spec in ipairs(require("nvconfig").mason.pkgs) do
      local name = spec:match "^([^@]+)"
      local ok, pkg = pcall(reg.get_package, name)
      if ok and not pkg:is_installed() then todo[#todo + 1] = name end
    end
    for _, pkg in ipairs(reg.get_installed_packages()) do
      if pkg:get_installed_version() ~= pkg:get_latest_version() then todo[#todo + 1] = pkg.name end
    end
    if #todo == 0 then print "mason: up to date" return end
    vim.cmd("MasonInstall " .. table.concat(todo, " "))
  ' +qa
}

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
  update_alacritty

  # nvim lazy + mason
  update_nvim

  # tmux plugin update
}
