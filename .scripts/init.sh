#!/bin/bash

apt update -q 
apt upgrade -y
apt dist-upgrade -y

export DEBIAN_FRONTEND=noninteractive

ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime
apt install -y tzdata
dpkg-reconfigure --frontend noninteractive tzdata

apt install -y \
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
    nmap \
    wget \
    git \
    ansible \
    software-properties-common 


apt install -y \
    python3 \
    python3-pip


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install node
nvm use node
npm i -g tldr sass @nestjs/cli @angular/cli npm-check-updates typescript license-checker 

 
apt autoremove 

apt install zsh
chsh -s $(which zsh)
sh -c “$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)”

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

curl -fsSL https://starship.rs/install.sh | zsh
ehco 'eval “$(starship init zsh)”' >> $HOME/.zshrc
mkdir -p ~/.config && touch ~/.config/starship.toml

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "done"