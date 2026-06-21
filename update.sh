#!/bin/sh
# イタズラ基地を最新化する。基地ディレクトリで `sh update.sh` を実行。
cd "$(dirname "$0")" || exit 1
git pull --ff-only || { echo "pullに失敗。git statusを確認してね。"; exit 1; }
echo
echo "=== 輸入済みのイタズラ一覧 ==="
for v in virus*.sed; do
  [ -e "$v" ] || continue
  printf "  source train.sh %s\n" "$v"
done
echo
echo "迷ったら: source reset_all.sh"
