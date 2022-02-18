# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
#eval $(/bin/brew shellenv)
#eval $(/bin/brew shellenv)
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
# Path to your oh-my-zsh installation.
export ZSH="/home/p/.oh-my-zsh"

export HISTCONTROL=ignoreboth
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="$HOME/.scripts:$PATH"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="%d%m%Y %H:%M:%S"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	dotenv
#	lol
	jsontools
	python
	sudo
	systemd
	wd
	web-search
	docker
	docker-compose
  #pipenv
	rsync
  virtualenv
	nmap
	#ng
	node
	pep8
	profiles
	zsh-syntax-highlighting
	zsh-autosuggestions
	nvm
 # zsh-pyenv
  wakatime
)

source $ZSH/oh-my-zsh.sh
source $ZSH_CUSTOM/themes/powerlevel10k/powerlevel10k.zsh-theme
# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.


# functions

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


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#  aliases
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias sshconfig="vim ~/.ssh/config"
alias ppub='cat ~/.ssh/id_rsa.pub'
alias copy='xclip -sel clip'
alias cpub='ppub | copy'
alias sit='cd /home/p/code'
alias mdh-upgrade='cd /home/p/code/MDH/Upgrade'
alias koe-tds-app='cd /home/p/code/koemmerling/tds-app'
alias dpkg-list="dpkg -l | grep ^ii | awk '{print $2}'"
alias gcp='git commit -p'
alias gpt='git push origin --tags'
alias laht='ls -lAhiFtc'
alias lah='ls -lah'
alias cplast="history | cut -c 8- | tail -1 | copy"
alias edit-zshrc="vim ~/.zshrc"

alias gogh='bash -c  "$(wget -qO- https://git.io/vQgMr)"'
alias please="sudo"


alias dotfiles="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias rimraf="rm -rf "
alias du1="du -hd 1 "
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias mv="mv -i"
alias rm="rm -i"



alias ls=exa

# Get latest container ID
alias dl="docker ps -l -q"
# Get container process
alias dps="docker ps"
# Get process included stop container
alias dpa="docker ps -a"
# Get images
alias di="docker images"
# Get container IP
alias dip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"
# Run deamonized container, e.g., $dkd base /bin/echo hello
alias dkd="docker run -d -P"
# Run interactive container, e.g., $dki base /bin/bash
alias dki="docker run -i -t -P"
# Execute interactive container, e.g., $dex base /bin/bash
alias dex="docker exec -i -t"
# Stop all containers
dstop() { docker stop $(docker ps -a -q); }
# Remove all containers
drm() { docker rm $(docker ps -a -q); }
# Stop and Remove all containers
alias drmf='docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
# Remove all images
dri() { docker rmi $(docker images -q); }
# Dockerfile build, e.g., $dbu tcnksm/test 
dbu() { docker build -t=$1 .; }
# Show all alias related docker
dalias() { alias | grep 'docker' | sed "s/^\([^=]*\)=\(.*\)/\1 => \2/"| sed "s/['|\']//g" | sort; }
# Bash into running container
dbash() { docker exec -it $(docker ps -aqf "name=$1") bash; }


export AWS_SHARED_CREDENTIALS_FILE=~/.aws/credentials
export AWS_CONFIG_FILE=~/.aws/configi


export DENO_INSTALL="/home/p/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
 [[ ! -f ~/.scripts/functions.zsh ]] || source ~/.scripts/functions.zsh
#[ -x "$(command -v neofetch)" ] && neofetch || echo ''



fpath+=(~/.config/hcloud/completion/zsh)
fpath+=(~/.zsh/completion)
#  ... anything else that needs to be done before compinit
autoload -Uz compinit; compinit
# ...
#
#
