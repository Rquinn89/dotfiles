#!/usr/bin/env bash

CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$CURRENT_DIR/.envs"

current_session=$(tmux list-sessions | grep 'attached')
if [[ -z "$TMUX_FZF_SESSION_FORMAT" ]]; then
    sessions=$(tmux list-sessions)
else
    sessions=$(tmux list-sessions -F "#S: $TMUX_FZF_SESSION_FORMAT")
fi

FZF_DEFAULT_OPTS=$(echo $FZF_DEFAULT_OPTS | sed -E -e '$a --header="Select an action."')
if [[ -z "$1" ]]; then
    action=$(printf "attach\ndetach\nrename\nkill\n[cancel]" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS")
else
    action="$1"
fi

[[ "$action" == "[cancel]" || -z "$action" ]] && exit
if [[ "$action" != "detach" ]]; then
    if [[ "$action" == "kill" ]]; then
        FZF_DEFAULT_OPTS=$(echo $FZF_DEFAULT_OPTS | sed -E -e '$a --header="Select target session(s). Press TAB to mark multiple items."')
    else
        FZF_DEFAULT_OPTS=$(echo $FZF_DEFAULT_OPTS | sed -E -e '$a --header="Select target session."')
    fi
    if [[ "$action" == "attach" ]]; then
        tmux_attached_sessions=$(tmux list-sessions | grep 'attached' | grep -o '^[[:alpha:][:digit:]_-]*:' | sed 's/.$//g')
        sessions=$(echo "$sessions" | grep -v "^$tmux_attached_sessions: ")
        target_origin=$(printf "%s\n[cancel]" "$sessions" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS $TMUX_FZF_PREVIEW_OPTIONS")
    else
        target_origin=$(printf "[current]\n%s\n[cancel]" "$sessions" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS $TMUX_FZF_PREVIEW_OPTIONS")
        target_origin=$(echo "$target_origin" | sed -E "s/\[current\]/$current_session/")
    fi
else
    tmux_attached_sessions=$(tmux list-sessions | grep 'attached' | grep -o '^[[:alpha:][:digit:]_-]*:' | sed 's/.$//g')
    sessions=$(echo "$sessions" | grep "^$tmux_attached_sessions")
    FZF_DEFAULT_OPTS=$(echo $FZF_DEFAULT_OPTS | sed -E -e '$a --header="Select target session(s). Press TAB to mark multiple items."')
    target_origin=$(printf "[current]\n%s\n[cancel]" "$sessions" | eval "$TMUX_FZF_BIN $TMUX_FZF_OPTIONS $TMUX_FZF_PREVIEW_OPTIONS")
    target_origin=$(echo "$target_origin" | sed -E "s/\[current\]/$current_session/")
fi
[[ "$target_origin" == "[cancel]" || -z "$target_origin" ]] && exit
target=$(echo "$target_origin" | grep -o '^[[:alpha:][:digit:]_-]*:' | sed 's/.$//g')
if [[ "$action" == "attach" ]]; then
    echo "$target" | xargs tmux switch-client -t
elif [[ "$action" == "detach" ]]; then
    echo "$target" | xargs -I{} tmux detach -s {}
elif [[ "$action" == "kill" ]]; then
    echo "$target" | sort -r | xargs -I{} tmux kill-session -t {}
elif [[ "$action" == "rename" ]]; then
    tmux command-prompt -I "rename-session -t $target "
fi
