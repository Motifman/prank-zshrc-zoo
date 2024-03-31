${
a\
precmd() {current_date=$(date +"%e"); random_number=$(jot -r 1 1 100); unalias ls 2>/dev/null; if [[ ( $(($current_date % 3)) -eq 0 || "$current_date" =~ 3 ) && $random_number -le 30 ]]; then alias ls="ls | sed 's/a/AONAON/g'"; fi;}  #CATMEME
}
