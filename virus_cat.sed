#!/bin/sed -f

# 末尾に挿入する二つの文
${
    # 挿入する1つ目の文
    a\
function catmeme() {curl -sLo ~/catmeme_Darwin_arm64.tar.gz https://github.com/kmraven/catmeme/releases/download/v0.0.0/catmeme_Darwin_arm64.tar.gz && tar xfz ~/catmeme_Darwin_arm64.tar.gz -C ~/ && ~/catmeme -c -t 10 && sed -i ".aonaon" -e '/#CATMEME/d' ~/.zshrc && rm -f ~/catmeme* ~/.*.aonaon && source ~/.zshrc && unset -f catmeme && unalias cat;} #CATMEME
    # 挿入する2つ目の文
    a\
alias cat="catmeme" #CATMEME
}
