# Function to get the current Git branch and check for changes
function get_git_branch() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    BRANCH=$(git branch --show-current 2>/dev/null)

    # If there are uncommitted changes, add an asterisk next to the branch name in red
    if [[ -n $(git status --porcelain) ]]; then
      BRANCH="\[\033[31m\]$BRANCH - *\[\033[00m\]" # Red for uncommitted changes
    fi

    # Return branch with magenta color
    echo "( \[\033[32m\]$BRANCH\[\033[00m\] )" # Magenta for branch, reset after
  fi
}

# Set the PROMPT_COMMAND to update PS1 dynamically
PROMPT_COMMAND='PS1="${debian_chroot:+($debian_chroot)}[ \[\033[32m\]\u\[\033[00m\] @ \[\033[36m\]\h\[\033[00m\] ] \[\033[34m\]\w\[\033[00m\] $(get_git_branch) \$ "'

alias rbt='reboot'
alias st='shutdown now'
alias lgt='i3-msg exit'
alias cma='gitadd_commit'
alias wifi='nmtui'
alias hst='wihotspot'

export PATH="$PATH:$HOME"
