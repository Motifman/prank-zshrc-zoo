# どの virus でも #CATMEME 由来を一括除去する万能リセット（誤爆時の保険）
sed -i".aonaon" '/#CATMEME/d' ~/.zshrc
rm -f ~/.*.aonaon
# train.sh が取った最終保険のバックアップも掃除
rm -f ~/.zshrc.PRANKBAK
# 既知の virus が張る alias / 関数 / 変数を片っ端から解除（無ければ黙って無視）
for a in ls cat vi vim nvim emacs nano awk; do unalias "$a" 2>/dev/null; done
for f in lls catmeme precmd; do unset -f "$f" 2>/dev/null; done
unset RPROMPT 2>/dev/null
source ~/.zshrc
