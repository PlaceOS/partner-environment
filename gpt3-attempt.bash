#!/usr/bin/env bash

PLACEOS_RELEASE_REPO="PlaceOS/PlaceOS"

CALVER_FULL_REGEX='[0-9]+\.[0-9]{4}\.[0-9]+(-rc[0-9]+)?'
CALVER_MONTH_REGEX='[0-9]+\.[0-9]{4}'
VERSION_CHANNEL_REGEX='(nightly|preview|latest)'

fetch_release_tags() (
    git ls-remote https://github.com/${PLACEOS_RELEASE_REPO} |
        cut -f2 |
        grep '^refs/tags/' |
        cut -d'/' -f3 |
        sort --version-sort --reverse |
        sed -E "s/($CALVER_FULL_REGEX|$CALVER_MONTH_REGEX)/placeos-\1/g"
)


_placeos() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    if [[ ${prev} == placeos ]]; then
        COMPREPLY=( $(compgen -W "start stop task changelog update upgrade uninstall help" -- ${cur}) )
        return 0
    fi

    case "${prev}" in
        start)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "
                        --email
                        --password
                        --application
                        --domain
                        --hard-reset
                        -v --verbose
                        -h --help
                        " -- ${cur}) )
                    ;;
            esac
            ;;
        stop)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "-v --verbose -h --help" -- ${cur}) )
                    ;;
            esac
            ;;
        task)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "-t --tasks -h --help" -- ${cur}) )
                    ;;
            esac
            ;;
        changelog)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "--full -h --help" -- ${cur}) )
                    ;;
            esac
            ;;
        update)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "--restart -v --verbose -h --help" -- ${cur}) )
                    ;;
                *)
                    COMPREPLY=( $(compgen -W "$(fetch_release_tags)" -- ${cur}) )
                    ;;
            esac
            ;;
        upgrade)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "--list -q --quiet -h --help" -- ${cur}) )
                    ;;
            esac
            ;;
        uninstall)
            case ${cur} in
                -*)
                    COMPREPLY=( $(compgen -W "--force -h --help" -- ${cur}) )
                    ;;
            esac
            ;;
    esac
    return 0
}

complete -F _placeos placeos
