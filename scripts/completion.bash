#!/usr/bin/env bash

PLACEOS_RELEASE_REPO="PlaceOS/PlaceOS"
CALVER_FULL_REGEX='[0-9]+\.[0-9]{4}\.[0-9]+(-rc[0-9]+)?'
CALVER_MONTH_REGEX='[0-9]+\.[0-9]{4}'

fetch_release_tags() (
    git ls-remote https://github.com/${PLACEOS_RELEASE_REPO} |
        cut -f2 |
        grep '^refs/tags/' |
        cut -d'/' -f3 |
        sort --version-sort --reverse |
        sed -E "s/($CALVER_FULL_REGEX|$CALVER_MONTH_REGEX)/placeos-\1/g"
)

PARTNER_ENV_REPO="placeos/partner-environment"

fetch_environment_tags() (
    git ls-remote https://github.com/${PARTNER_ENV_REPO} |
        cut -f2 |
        grep --extended-regexp '^refs/tags/|HEAD' |
        cut -d'/' -f3 |
        sort --version-sort --reverse
)

fetch_task_list() (
    placeos task --list 2>/dev/null | grep --extended-regexp '^\w+[\: ].*\|' | sed -E 's/ +/ /g' | cut -d' ' -f1
)

_placeos() {
    local cur prev
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    case "${prev}" in
        placeos)
            case "${cur}" in
                -*)
                    COMPREPLY=( $(compgen -W "
                        -h --help
                        " -- ${cur}) )
                    ;;
                *)
                    COMPREPLY=( $(compgen -W "
                        start
                        stop
                        task
                        changelog
                        update
                        upgrade
                        uninstall
                        version
                        help
                        " -- ${cur}) )
                    ;;
            esac
            ;;
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
                    COMPREPLY=( $(compgen -W "--list -h --help" -- ${cur}) )
                    ;;
                *)
                    COMPREPLY=( $(compgen -W "$(fetch_task_list)" -- ${cur}) )
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
                *)
                    COMPREPLY=( $(compgen -W "$(fetch_environment_tags)" -- ${cur}) )
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
