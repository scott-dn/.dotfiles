# .dotfiles

Arch Linux (KDE Plasma).

### Install

```bash
# yay (aur helper)
$ git clone https://aur.archlinux.org/yay-bin.git /tmp/yay-bin \
    && (cd /tmp/yay-bin && makepkg -si) && rm -rf /tmp/yay-bin \
    && yay -S bauh

# packages
$ sudo pacman -S --needed \
    git base-devel zsh tmux alacritty neovim go nvm ttf-jetbrains-mono-nerd noto-fonts-emoji \
    lazygit ripgrep fd fzf lsd bat diff-so-fancy less unzip tree-sitter-cli wl-clipboard fprintd terraform docker \
    fcitx5 fcitx5-unikey fcitx5-configtool fcitx5-qt fcitx5-gtk \
    dolphin

# bauh patch: 0.10.7 uses pkgutil.find_loader, removed in python 3.14 (skip once upstream fixes it).
# reapply after every bauh reinstall/update, `yay -Sua` overwrites it
$ sudo sed -i \
    -e 's/^import pkgutil$/import importlib\nimport importlib.util/' \
    -e 's/pkgutil.find_loader(/importlib.util.find_spec(/' \
    -e 's/loader.load_module()/importlib.import_module(loader.name)/' \
    /usr/lib/python3.14/site-packages/bauh/view/core/gems.py

#apps
$ yay -S google-chrome slack-desktop

# zsh (login shell; log out and back in afterwards)
$ chsh -s /usr/bin/zsh

# kde shortcuts: System Settings > Keyboard > Shortcuts > Import Scheme… > keyboard_shortcuts.kksrc

# others
$ sudo pacman -S steam proton-vpn-gtk-app discord
$ sudo systemctl restart NetworkManager
```

### Update

```bash
# everything (pacman, yay, rustup, omz, claude, node, nvim)
$ update_devtools
```
