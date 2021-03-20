#!/bin/bash

export WD=$PWD # Save conf location
export RUNZSH=no

# Download and Install yay
cd /tmp
echo "moved to /tmp"
git clone https://aur.archlinux.org/yay.git
echo "cloning yay"
cd yay
echo "moved to $PWD"
makepkg -si
echo "made yay package"
cd ..
rm -rf yay
echo "removed yay directory"

sudo pacman-key --init
sudo pacman-key --populate archlinux

# Install packages
yay -S neovim zsh neofetch wget nodejs lazygit lsd 


# Configure internet
sudo systemctl enable NetworkManager
echo "enabled NetworkManager.service"

mkdir -p $HOME/.config/neofetch

# Configure nvim
cd $HOME/.config/
echo "moved to $PWD"
ln -sf $WD/nvim nvim
echo "linking $WD/nvim to $PWD/nvim"

# Download and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download epic zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# symbol link zsh related files
ln -sf $WD/.zshrc $HOME/.zshrc
echo "linking $WD/.zshrc to $HOME/.zshrc"

ln -sf $WD/.p10k.zsh $HOME/.p10k.zsh
echo "linking $WD/.p10k.zsh to $HOME/.p10k.zsh"

ln -sf $WD/neofetch/config.conf $HOME/.config/neofetch/config.conf
echo "linking $WD/neofetch/config.conf to $HOME/.config/neofetch/config.conf"

# start zsh
exec zsh -l
