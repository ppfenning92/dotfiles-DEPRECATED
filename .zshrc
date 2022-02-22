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

setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
# some useful options (man zshoptions)
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments
stty stop undef		# Disable ctrl-s to freeze terminal.
zle_highlight=('paste:none')

export HISTCONTROL=ignoreboth
export HISTFILE=$HOME/.zsh_history
HISTSIZE=9999999
SAVEHIST=9999999
export PATH="$HOME/.scripts:$PATH"
export ZDOTDIR="$HOME/.config/zsh"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#586e75'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='bg=#d33682,fg=#002b36,bold'
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='bg=#dc322f,fg=#002b36,bold'
export HISTORY_SUBSTRING_SEARCH_FUZZY=
export HISTORY_SUBSTRING_SEARCH_PREFIXED=1
export HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

source $HOME/.config/zsh/plugins/dotenv.plugin.zsh
source $HOME/.config/zsh/plugins/sudo.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
source $HOME/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.config/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/.config/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up	
bindkey '^[[B' history-substring-search-down
bindkey "$key[Up]" history-substring-search-up
bindkey "$key[Down]" history-substring-search-down

export HIST_STAMPS="%d%m%Y %H:%M:%S"


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




