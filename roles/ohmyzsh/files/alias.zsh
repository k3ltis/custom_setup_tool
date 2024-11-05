alias fzf-branch='git branch | fzf | xargs git checkout'
alias fzf-branch-delete='git branch | fzf -m | xargs git branch -D'
alias fzf-directory-cd='cd $(fd --type d | fzf)'
alias tmux-neww-fzf-dir='tmux new-window -c $(fd --type d | fzf)'
alias tmux-neww-dir='tmux new-window -c '
alias k9s-head-logo-less='k9s --headless --logoless'
alias susudo='sudo -E env "PATH=$PATH"'
alias doco='docker compose'
alias win_path_to_unix_path='bash $HOME/.oh-my-zsh/custom/scripts/win_path_to_unix_path.sh'
