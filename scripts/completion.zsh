#compdef placeos

local -a _1st_arguments
_1st_arguments=(
  'start:Start the environment.'
  'stop:Stops the environment.'
  'task:Runs a task in the environment.'
  'changelog:Displays platform changelog (in markdown).'
  'update:Update the platform version.'
  'upgrade:Upgrade the Partner Environment.'
  'uninstall:Uninstalls the Partner Environment.'
  'help:Display this message.'
)

local -a _start_arguments
_start_arguments=(
  '--email:Email to setup an admin account for.'
  '--password:Password for created admin account.'
  '--application:Application to configure.'
  '--domain:Domain to configure.'
  '--hard-reset:Reset the environment to a default state.'
  '-v:Write logs to STDOUT in addition to the log file.'
  'h:Display this message'
)

local -a _stop_arguments
_stop_arguments=(
  '-v:Write logs to STDOUT in addition to the log file.'
  '-h:Display this message.'
)

local -a _task_arguments
_task_arguments=(
  '-t:--tasks:Display list of available tasks.'
  '-h:Display this message.'
)

local -a _changelog_arguments
_changelog_arguments=(
  '--full:Include all prior CHANGELOG entries.'
  '-h:Display this message'
)

local -a _update_arguments
_update_arguments=(
  '--list:List the available versions.'
  '-v:--verbose:Write logs to STDOUT in addition to the log file.'
  '-h:Display this message.'
)

local -a _upgrade_arguments
_upgrade_arguments=(
  '--list:Lists versions of the Partner Environment.'
  '-q:Do not write command logs to STDOUT.'
  '-h:Display this message.'
)

local -a _uninstall_arguments
_uninstall_arguments=(
  '--force:Skip confirmation of uninstall.'
  '-h:Display this message.'
)

_arguments -C \
  '1: :->subcommand' \
  '*:: :->task' && return 0

case $state in
  (subcommand)
    _describe -t commands 'PlaceOS subcommand' _1st_arguments && return 0
    ;;
  (task)
    case $line[1] in
      (start)
        _describe -t commands 'PlaceOS start task' _start_arguments && return 0
        ;;
      (stop)
        _describe -t commands 'PlaceOS stop task' _stop_arguments && return 0
        ;;
      (task)
        _describe -t commands 'PlaceOS task task' _task_arguments && return 0
        ;;
      (changelog)
        _describe -t commands 'PlaceOS changelog task' _changelog_arguments && return 0
        ;;
      (update)
        _describe -t commands 'PlaceOS update task' _update_arguments && return 0
        ;;
      (upgrade)
        _describe -t commands 'PlaceOS upgrade task' _upgrade_arguments && return 0
        ;;
      (uninstall)
        _describe -t commands 'PlaceOS uninstall task' _uninstall_arguments && return 0
        ;;
      (help)
        _describe -t commands 'PlaceOS help task' _help_arguments && return 0
        ;;
    esac
    ;;
esac-
