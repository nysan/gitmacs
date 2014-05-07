# Print the __git_ps1 string unless the git directory is $HOME.
function git_ps1() {
    GD="$(git rev-parse --show-toplevel 2>/dev/null)"
    if [ "$GD" != "$HOME" ]; then
        __git_ps1 ' [%s]'
    fi
}

if [ $TERM != "linux" ]; then
    TITLEBAR="\[\e]2;\w\a\]"
fi
GIT_PS1_SHOWDIRTYSTATE=1
PROMPT="\u@\h\n\w\$(git_ps1)\n\$ "
PS1="$TITLEBAR\[\e[32;1m\]$PROMPT\[\e[0m\]"

#PROMPT="\u@\h:\w\>\n\$ "
