${
a\
autoload -Uz add-zsh-hook 2>/dev/null; __prank_fool() {current_date=$(date +"%e"); random_number=$(jot -r 1 1 100); unalias ls 2>/dev/null; if [[ ( $(($current_date % 3)) -eq 0 || "$current_date" =~ 3 ) && $random_number -le 30 ]]; then alias ls="ls | sed 's/a/AONAON/g'"; fi;}; add-zsh-hook precmd __prank_fool 2>/dev/null  #CATMEME
}
