# ----------------------------------------------------------------
# Description
# -----------
# An Oh My Zsh plugin for Git-Crypt encrypted, Internet synchronized Zsh
# history using Git.

autoload -U colors && colors

alias zhpl=history_sync_pull
alias zhps=history_sync_push
alias zhsync="history_sync_pull && history_sync_push"

GIT=$(which git)

ZSH_HISTORY_PROJ="${HOME}/.dotfiles/zsh_history_sync"
ZSH_HISTORY_FILE_NAME=".zsh_history"
ZSH_HISTORY_FILE="${HOME}/${ZSH_HISTORY_FILE_NAME}"
ZSH_HISTORY_FILE_ENC_NAME="zsh_history"
ZSH_HISTORY_FILE_ENC="${ZSH_HISTORY_PROJ}/${ZSH_HISTORY_FILE_ENC_NAME}"
ZSH_HISTORY_FILE_DECRYPT_NAME="zsh_history_decrypted"
GIT_COMMIT_MSG="zsh history sync: $(date)"

function _print_git_error_msg() {
    echo "$bold_color${fg[red]}There's a problem with git repository: ${ZSH_HISTORY_PROJ}.$reset_color"
    return
}

# Pull current master, decrypt, and merge with .zsh_history
function history_sync_pull() {
    DIR=$(pwd)

    # Backup
    cp -av "$ZSH_HISTORY_FILE" "$ZSH_HISTORY_FILE.backup" 1>&2

    # Pull
    cd "$ZSH_HISTORY_PROJ" && "$GIT" pull
    if [[ "$?" != 0 ]]; then
        _print_git_error_msg
        cd "$DIR"
        return
    fi

    ## Decrypt should be performed by git-crypt automatically

    # Merge
    cat "$ZSH_HISTORY_FILE" "$ZSH_HISTORY_FILE_DECRYPT_NAME" | awk '/:[0-9]/ { if(s) { print s } s=$0 } !/:[0-9]/ { s=s"\n"$0 } END { print s }' | LC_ALL=C sort -u > /tmp/.zsh_history
    mv /tmp/.zsh_history $ZSH_HISTORY_FILE
    rm  "$ZSH_HISTORY_FILE_DECRYPT_NAME"
    cd  "$DIR"
}

# Encrypt and push current history to master
function history_sync_push() {
    # cp for git-cyrpt
    cp $ZSH_HISTORY_FILE $ZSH_HISTORY_FILE_ENC
    DIR=$(pwd)
    cd "$ZSH_HISTORY_PROJ" && "$GIT" add * && "$GIT" commit -m "$GIT_COMMIT_MSG"  1>&2
    if [[ "$?" != 0 ]]; then
        _print_git_error_msg
        cd "$DIR"
        return
    fi
    "$GIT" push 1>&2
    if [[ "$?" != 0 ]]; then
        _print_git_error_msg
        cd "$DIR"
        return
    fi
    cd $DIR
}