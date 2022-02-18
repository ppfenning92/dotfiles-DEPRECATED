if [ -x "$(command -v exa)" ]; then
  alias ls="exa"
  alias la="ls -laFhHumG"
  alias ll="ls -laF"
  alias tree="ls -laHT "
  alias tree1="ls -laHTL 1"
  alias tree2="ls -laHTL 2"
  alias tree3="ls -laHTL 3"
  alias tree4="ls -laHTL 4"
else
  echo "exa is not installed"
  alias ll="ls -lAF"
fi
alias sl="ls"
alias sls="ls"
alias sl-="ls"
alias ls-="ls"

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"

    alias grep='grep --color=auto'
#   alias fgrep='fgrep --color=auto'
    alias fgrep='fgrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
#   alias egrep='egrep --color=auto'
    alias egrep='egrep --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn,.idea,.tox}'
fi



if [ -x "$(command -v nmap)" ]; then
  alias nmap_open_ports="nmap --open"
  alias nmap_list_interfaces="nmap --iflist"
  alias nmap_slow="sudo nmap -sS -v -T1"
  alias nmap_fin="sudo nmap -sF -v"
  alias nmap_full="sudo nmap -sS -T4 -PE -PP -PS80,443 -PY -g 53 -A -p1-65535 -v"
  alias nmap_check_for_firewall="sudo nmap -sA -p1-65535 -v -T4"
  alias nmap_ping_through_firewall="nmap -PS -PA"
  alias nmap_fast="nmap -F -T5 --version-light --top-ports 300"
  alias nmap_detect_versions="sudo nmap -sV -p1-65535 -O --osscan-guess -T4 -Pn"
  alias nmap_check_for_vulns="nmap --script=vuln"
  alias nmap_full_udp="sudo nmap -sS -sU -T4 -A -v -PE -PS22,25,80 -PA21,23,80,443,3389 "
  alias nmap_traceroute="sudo nmap -sP -PE -PS22,25,80 -PA21,23,80,3389 -PU -PO --traceroute "
  alias nmap_full_with_scripts="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS21,22,23,25,80,113,31339 -PA80,113,443,10042 -PO --script all "
  alias nmap_web_safe_osscan="sudo nmap -p 80,443 -O -v --osscan-guess --fuzzy "
  alias nmap_ping_scan="nmap -n -sP"
fi

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias .......="cd ../../../../../.."
alias ........="cd ../../../../../../.."
alias .........="cd ../../../../../../../.."
alias ..........="cd ../../../../../../../../.."
alias ..1=".."
alias ..2="..."
alias ..3="...."
alias ..4="....."
alias ..5="......"
alias ..6="......."
alias ..7="........"
alias ..8="........."
alias ..9=".........."
alias ..0="..........."
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'
alias _='sudo '

alias rm="rm -i"
alias cp="cp -i"
alias mv="mv -i"

alias py="python"
alias js="node"
alias md="mkdir -vp"

alias pygrep='grep -nr --include="*.py"'
alias jsgrep='grep -nr --include="*.(js|ts|jsx|tsx)"'
alias csssgrep='grep -nr --include="*.(css|less|scss|sass)"'
alias phpgrep='grep -nr --include="*.php"'
alias mdgrep='grep -nr --include="*.md"'
alias htmlgrep='grep -nr --include="*.html"'


