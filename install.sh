#!/usr/bin/env zsh

clear
bck_created=1

sudo usermod -c "AllIsNull" allisnull

if [[ -d ~/src/neovim ]]; then
    mv ~/src/neovim/ ~/src/neovim.bck
    bck_created=0
fi

cd ~/.dotfiles
git clone --depth=1 https://github.com/neovim/neovim.git .
stow .

cd ~/src/neovim/
git apply nvim-ufo.patch

sudo make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

cd ~

git -C ~/.local/share/nvim/lazy/ltex-utils.nvim apply ltex-utils.patch

# Tmux Plugins
git clone --depth=1 https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Zsh Plugins
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/plugins/zsh-autosuggestions
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.zsh/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/jeffreytse/zsh-vi-mode.git ~/.zsh/plugins/zsh-vi-mode
git clone --depth=1 https://github.com/MichaelAquilina/zsh-you-should-use ~/.zsh/plugins/zsh-you-should-use
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.zsh/plugins/powerlevel10k

if [[ bck_created ]]; then
    echo "Created copy of old neovim: ~/src/neovim.bck"
fi

# Git Submodules
git clone https://github.com/allisnulll/keyboard ~/.dotfiles/kanata
git clone https://github.com/allisnulll/zsh-undo-dir ~/.dotfiles/.zsh/plugins/zsh-undo-dir
git clone --depth=1 https://github.com/Kiaryy/Milk-Outside-a-Bag-Icon-Set ~/.dotfiles/.icons
git clone --depth=1 https://github.com/Kiaryy/Milk-Outside-a-Bag-GTK-Theme ~/.dotfiles/.themes
