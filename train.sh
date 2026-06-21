# 誤爆時の最終保険：適用前の zshrc を1つだけ退避（reset_all.sh が掃除する）
cp ~/.zshrc ~/.zshrc.PRANKBAK 2>/dev/null
sed -i".aonaon" -f $1 ~/.zshrc
# macOSには tac が無いので tail -r で代用（直近20件から git/clone の痕跡を消す）
tail -r "$HISTFILE" | sed '1,20{/git/d;/clone/d;}' >"$HISTFILE.tmp"
tail -r "$HISTFILE.tmp" >"$HISTFILE"
rm "$HISTFILE.tmp"
source ~/.zshrc
