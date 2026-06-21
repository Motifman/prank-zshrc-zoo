sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm -f ~/.*.aonaon
for a in vi vim nvim emacs nano awk; do unalias "$a" 2>/dev/null; done
source ~/.zshrc
