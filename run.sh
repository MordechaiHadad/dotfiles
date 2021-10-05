#!/bin/bash

WD=$PWD # Save conf location
export RUNZSH=no
OS=$(uname -r)

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

echo "Successfully installed yay"

if echo $OS | grep "WSL" > /dev/null; then

    # Initing and populating pacman key
    sudo pacman-key --init
    sudo pacman-key --populate archlinux
fi

# Install packages
echo "Installing good packages"
yay -S neovim zsh neofetch wget nodejs lazygit lsd clang jq procs direnv zoxide

# Download and install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Download powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Download epic zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autocomplete

# Configure nvim
ln -sf $WD/nvim $HOME/.config/nvim
echo "linking $WD/nvim to $HOME/.config/nvim"

# Configure zsh
ln -sf $WD/.zshrc $HOME/.zshrc
echo "linking $WD/.zshrc to $HOME/.zshrc"

ln -sf $WD/.p10k.zsh $HOME/.p10k.zsh
echo "linking $WD/.p10k.zsh to $HOME/.p10k.zsh"

# Configure neofetch
ln -sf $WD/neofetch $HOME/.config/neofetch
echo "linking $WD/neofetch to $HOME/.config/neofetch"

# Check if using WSL
if ! echo $OS | grep "WSL" > /dev/null; then
    echo "Detected not using WSL setting up GUI dotfiles"
    sudo systemctl enable NetworkManager
    echo "enabled NetworkManager.service"
fi

# Start zsh
exec zsh -l
