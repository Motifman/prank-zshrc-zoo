sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm -f ~/.*.aonaon
source ~/.zshrc
# 相手の本物の precmd には触れず、自分が積んだフックだけを外す
autoload -Uz add-zsh-hook 2>/dev/null
add-zsh-hook -d precmd __prank_sidejob 2>/dev/null
unfunction __prank_sidejob 2>/dev/null
unset RPROMPT
