${
a\
autoload -Uz add-zsh-hook 2>/dev/null; __prank_sidejob() { local msgs=("💼 副業募集中" "📈 今なら時給5000円" "🤝 いい案件あります" "💰 不労所得はじめました" "🚀 一緒に起業しませんか"); RPROMPT="${msgs[$((RANDOM % ${#msgs[@]} + 1))]}"; }; add-zsh-hook precmd __prank_sidejob 2>/dev/null  #CATMEME
}
