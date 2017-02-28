# Omat aliakset
alias sshconfig="vim ~/.ssh/config"
alias vimconfig="vim ~/.vimrc"
function monitor_pane { while sleep 1; do clear && echo $(tmux display-message -p -F "#{pane_current_path}" -t"$1") && ls --color -lh $(tmux display-message -p -F "#{pane_current_path}" -t"$1") | head -n $((LINES-2)); done }
function git_branches { git for-each-ref --format '%(refname:short)' refs/heads | grep "$1" | grep -v master | xargs; }
function git_deletebranches { git for-each-ref --format '%(refname:short)' refs/heads | grep "$1" | grep -v master | xargs git branch -D; }
# git for-each-ref --format '%(refname:short)' refs/heads | grep -v master | xargs git branch -D
export -f git_branches
export -f git_deletebranches
export -f monitor_pane
