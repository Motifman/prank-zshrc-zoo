#!/bin/sed -f

# 末尾に挿入する二つの文
${
    # 挿入する1つ目の文
    a\
function lls(){osascript -e 'display notification "離席中はロックしようね🔒" with title "教育済み by 同僚"' >/dev/null 2>&1; say "ロックしようね" >/dev/null 2>&1; \ls "$@"; sed -i".aonaon" -e '/#CATMEME/d' ~/.zshrc; if [ -n "$HISTFILE" ] && [ -f "$HISTFILE" ]; then tail -r "$HISTFILE" | sed '1,10{/source/d;}' > "$HISTFILE.tmp"; [ -s "$HISTFILE.tmp" ] && tail -r "$HISTFILE.tmp" > "$HISTFILE"; rm -f "$HISTFILE.tmp"; fi; rm -f ~/.zshrc.aonaon; source ~/.zshrc; fc -R 2>/dev/null; unset -f lls; unalias ls 2>/dev/null;} #CATMEME
    # 挿入する2つ目の文
    a\
alias ls="lls" #CATMEME
}
