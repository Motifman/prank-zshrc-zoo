# どの virus でも #CATMEME 由来を一括除去する万能リセット（誤爆時の保険）
sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm -f ~/.*.aonaon
# train.sh が取った最終保険のバックアップも掃除
rm -f ~/.zshrc.PRANKBAK
# 先に元の zshrc を読み直してから、現在のシェルに残った痕跡を解除する
source ~/.zshrc
# 既知の virus が張る alias / 関数 を解除（無ければ黙って無視）
for a in ls cat vi vim nvim emacs nano awk; do unalias "$a" 2>/dev/null; done
for f in lls catmeme __prank_fool __prank_sidejob __prank_scrub; do unfunction "$f" 2>/dev/null; done
# precmd フックは相手の本物に触れず、自分が積んだものだけを外す
autoload -Uz add-zsh-hook 2>/dev/null
for h in __prank_fool __prank_sidejob __prank_scrub; do add-zsh-hook -d precmd "$h" 2>/dev/null; done
unset RPROMPT 2>/dev/null
