sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm ~/.*.aonaon
source ~/.zshrc
unset -f precmd
unalias ls
