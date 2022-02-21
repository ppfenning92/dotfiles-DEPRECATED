if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -f "/home/linuxbrew/.linuxbrew/bin/brew" ] ; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
fi
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export HISTCONTROL=ignoreboth

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"


HIST_STAMPS="%d%m%Y %H:%M:%S"

plugins=(
	1password
	ansible
	git
	dotenv
	jsontools
	python
	sudo
	systemd
	wd
	web-search
	docker
	docker-compose
	pipenv
	rsync
	virtualenv
	nmap
	ng
	node
	pep8
	profiles
	zsh-syntax-highlighting
	zsh-autosuggestions
	nvm
  	wakatime
)

[ ! -f $ZSH/oh-my-zsh.sh ] || source $ZSH/oh-my-zsh.sh
#[ ! -f $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme ] || source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme


function net_iface() {
	local adapter=$(nmcli device status | grep -F connected | grep -Fv disconnected | head -1 | awk '{print $2}')
      if [[ adapter -eq "ethernet" ]]; then
              echo $'\uf700'
      elif [[ adapter -eq "wifi" ]]; then
              echo $' \uf1eb '
      else
              echo $' \uf818 '
      fi
}



#  aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sshconfig="vim ~/.ssh/config"
alias ppub='cat ~/.ssh/id_rsa.pub'
alias copy='xclip -sel clip'
alias cpub='ppub | copy'
alias dpkg-list="dpkg -l | grep ^ii | awk '{print $2}'"
alias gcp='git commit -p'
alias gpt='git push origin --tags'
alias cplast="history | cut -c 8- | tail -1 | copy"

alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias please="sudo"
alias myip="dig @ns1.google.com TXT o-o.myaddr.l.google.com +short"

alias rimraf="rm -rf "
alias du1="du -hd 1 "

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias genpass="tr -dc 'A-Za-z0-9' < /dev/urandom | head -c23 | uniq"

[ ! -f $HOME/.aliases ] || source $HOME/.aliases

[ ! -f $HOME/.config/alias/bash_alias ] || source $HOME/.config/alias/bash_alias
[ ! -f $HOME/.config/alias/git_alias ] || source $HOME/.config/alias/git_alias
[ ! -f $HOME/.config/alias/docker_alias ] || source $HOME/.config/alias/docker_alias
[ ! -f $HOME/.config/alias/alternative_alias ] || source $HOME/.config/alias/alternative_alias

export AWS_SHARED_CREDENTIALS_FILE=$HOME/.aws/credentials
export AWS_CONFIG_FILE=$HOME/.aws/config


export DENO_INSTALL="$HOME/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

 [[ ! -f $HOME/.scripts/functions.zsh ]] || source $HOME/.scripts/functions.zsh


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fpath+=($HOME/.config/hcloud/completion/zsh)
fpath+=($HOME/.zsh/completion)


autoload -Uz compinit; compinit -i
#[ -x "$(command -v neofetch)" ] && neofetch || echo ''
eval "$(starship init zsh)"




