#!/bin/bash

echo "Update and Upgrade apt..."
sudo apt update -qqqq
sudo apt upgrade -y
sudo apt dist-upgrade -y
echo "Packages up to date."

echo "Install common packages..."
export DEBIAN_FRONTEND=noninteractive

echo "setting timezone"
sudo ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
sudo apt install -qq -y tzdata
sudo dpkg-reconfigure --frontend noninteractive tzdata

sudo apt install -qq -y \
    zsh \
    net-tools \
    figlet \
    cowsay \
    lolcat \
    zip \
    unzip \
    vim \
    tree \
    exa \
    curl \
    hcloud-cli \
    nmap \
    wget \
    git \
    ansible \
    software-properties-common 


sudo apt install -qq -y \
    python3 \
    python3-pip

echo "Common Packages installed."

echo "Installing nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts
nvm use --lts
npm i -g tldr sass @nestjs/cli @angular/cli npm-check-updates typescript license-checker 
echo "nvm installed"

echo "cleanup..."
apt autoremove
echo "cleanup done"


echo 'Installing ZSH, oh-my-zsh'
sudo apt install zsh
chsh -s $(which zsh)
sh -c “$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)”

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "ZSH with oh-my-zsh installed."

echo 'Installing Starship Promt...'
sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y > /dev/null
mkdir -p ~/.config && touch ~/.config/starship.toml
echo 'Starship installed.'

echo "install spacevim..."
sh -c "$(curl -sLf https://spacevim.org/install.sh)"
echo "spacevim installed."

echo "install 1password cli"
curl https://cache.agilebits.com/dist/1P/op/pkg/v1.12.4/op_linux_amd64_v1.12.4.zip -o op.zip
mkdir -vp /tmp/op && unzip op.zip -d /tmp/op
mkdir -vp $HOME/.local/bin/ && mv /tmp/op/op $HOME/.local/bin/
echo "1password cli installed"
