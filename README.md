# Dotfiles Patrick Pfenning

```bash
mkdir -vp ~/.dotfiles
alias df-git="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
df-git init
df-git remote add origin https://github.com/ppfenning92/dotfiles.git
df-git fetch --all
df-git checkout starship
df-git reset --hard
./.scripts/init.sh
```
