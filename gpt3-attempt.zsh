```zsh
#compdef placeos

_placeos() {
    typeset -A opt_args
    local context state line
    context=(-1 CATEGORY)
    _arguments \
        '1: :->command' \
        '*:: :->args' && return 0

    case $state in
        (command)
            _arguments \
                '1: :->command' \
                '*:: :->args' && return 0
            ;;
        (args)
            case $line[1] in
                (start)
                    _arguments \
                        '1: :->start' \
                        '*:: :->start' && return 0
                    ;;
                (stop)
                    _arguments \
                        '1: :->stop' \
                        '*:: :->stop' && return 0
                    ;;
                (task)
                   _arguments \
                        '1: :->task' \
                        '*:: :->task' && return 0
                    ;;
                (changelog)
                    _arguments \
                        '1: :->changelog' \
                        '*:: :->changelog' && return 0
                    ;;
                (update)
                    _arguments \
                        '1: :->update' \
                        '*:: :->update' && return 0
                    ;;
                (upgrade)
                    _arguments \
                        '1: :->upgrade' \
                        '*:: :->upgrade' && return 0
                    ;;
                (uninstall)
                    _arguments \
                        '1: :->uninstall' \
                        '*:: :->uninstall' && return 0
                    ;;
                (help)
                    _arguments \
                        '1: :->help' \
                        '*:: :->help' && return 0
                    ;;
            esac
            ;;
        (start)
            _arguments \
                '1: :->start' \
                '*:: :->start' && return 0
            ;;
        (stop)
            _arguments \
                '1: :->stop' \
                '*:: :->stop' && return 0
            ;;
        (task)
            _arguments \
                '1: :->task' \
                '*:: :->task' && return 0
            ;;
        (changelog)
            _arguments \
                '1: :->changelog' \
                '*:: :->changelog' && return 0
            ;;
        (update)
            _arguments \
                '1: :->update' \
                '*:: :->update' && return 0
            ;;
        (upgrade)
            _arguments \
                '1: :->upgrade' \
                '*:: :->upgrade' && return 0
            ;;
        (uninstall)
            _arguments \
                '1: :->uninstall' \
                '*:: :->uninstall' && return 0
            ;;
        (help)
            _arguments \
                '1: :->help' \
                '*:: :->help' && return 0
            ;;
    esac
}

_placeos "$@"
``` 
