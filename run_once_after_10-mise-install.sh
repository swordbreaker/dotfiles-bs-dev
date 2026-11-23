#!/bin/sh
set -eu

mise install


#   CHSH                   - 'no' means the installer will not change the default shell (default: yes)
#   RUNZSH                 - 'no' means the installer will not run zsh after the install (default: yes)
#   KEEP_ZSHRC             - 'yes' means the installer will not replace an existing .zshrc (default: no)
#
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  CHSH=no RUNZSH=no KEEP_ZSHRC=yes \
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" ]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi
