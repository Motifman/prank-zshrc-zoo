sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm -f ~/.*.aonaon
unalias ls 2>/dev/null
unset -f lls 2>/dev/null
source ~/.zshrc
