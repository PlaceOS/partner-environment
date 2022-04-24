<img align="right" src="https://github.com/placeos.png?size=200" alt="PlaceOS" />

# PlaceOS Partner Environment

[![CI](https://github.com/PlaceOS/partner-environment/actions/workflows/ci.yml/badge.svg)](https://github.com/PlaceOS/partner-environment/actions/workflows/ci.yml)

For use when testing, improving or experimenting with PlaceOS on a local machine.
Use it for driver, frontend, api and infrastructure development. **Treat it as insecure**.

When finished dev work for the day, stop the containers with `placeos stop`

*NOT* for production use.

## Drivers

See the [PlaceOS Drivers repository](https://github.com/PlaceOS/drivers) for further information.

## Installation

- Via `curl`:
  ```shell-session
  curl \
    --proto '=https' --tlsv1.2 \
    --location \
    --show-error --silent \
    --fail \
    https://raw.githubusercontent.com/PlaceOS/partner-environment/master/scripts/install | bash
  ```

- Via `wget`:
  ```shell-session
  wget -O - https://raw.githubusercontent.com/PlaceOS/partner-environment/master/scripts/install | bash
  ```

### Dependencies

These will need to be installed prior to installation:

- [bash >= 4.4.20](https://www.gnu.org/software/bash)
- [docker >= 18.06.0](https://docs.docker.com/engine/install)
- [git >= 2.27.0](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)

#### Optional tools

- [lazydocker](https://github.com/jesseduffield/lazydocker) for easy docker monitoring.
- [docker completion](https://docs.docker.com/compose/completion/) for more efficient terminal use.

### MacOS

If using [Docker Desktop for Mac](https://docs.docker.com/desktop/mac/install/), the default memory allocation of 2GB is insufficient for
running Elasticsearch in addition to the set of PlaceOS services.
Bumping the resource limit to 4GB should be sufficient.

## Configuration

- `PLACE_EMAIL`, `PLACE_PASSWORD`: Create an initial admin user via these environment variables
- `PLACE_DOMAIN`: Set an alternate application domain, defaults to `localhost:8443`

These environment variables can also be passed via the cli.

## Usage

### `$ placeos`

```shell-session
Usage: placeos [-h|--help] [command]

Helper script for interfacing with the PlaceOS Partner Environment.

Command:
    start                   Start the environment.
    stop                    Stops the environment.
    task                    Runs a task in the environment.
    update                  Update the platform version.
    upgrade                 Upgrade the Partner Environment.
    uninstall               Uninstalls the Partner Environment.
    help                    Display this message.
```

### `$ placeos start`

```shell-session
Usage: placeos start [-h|--help]

Start the PlaceOS environment.

Arguments:
    --email EMAIL           Email to setup an admin account for. [default: support@place.tech]
    --password PASSWORD     Password for created admin account.
    --application APP_NAME  Application to configure. [default: backoffice]
    --domain DOMAIN         Domain to configure. [default: localhost:8443]
    --hard-reset            Reset the environment to a default state.
    -v, --verbose           Write logs to STDOUT in addition to the log file.
    -h, --help              Display this message
```

### `$ placeos stop`

```shell-session
Usage: placeos stop [-h|--help]

Stop the PlaceOS environment.

Arguments:
    -v, --verbose           Write logs to STDOUT in addition to the log file.
    -h, --help              Display this message.
```

### `$ placeos task`

```shell-session
Usage: placeos task [-h|--help|help] [-t|--task] <task> [help|...] [arguments...]

Run a task in the PlaceOS environment.

Arguments:
    -t, ---tasks            Display list of available tasks.
    -h, --help              Display this message.
```

### `placeos update`

```
Usage: placeos update [-h|--help] [VERSION]

Modifies PLACEOS_TAG to the selected PlaceOS platform version.
If VERSION is omitted, defaults to the most recent stable version.

Arguments:
    --list                  List the available versions.
    -v, --verbose           Write logs to STDOUT in addition to the log file.
    -h, --help              Display this message.
```

### `placeos upgrade`

```
Usage: placeos upgrade [-h|--help] [VERSION]

Upgrades the PlaceOS Partner Environment.
If VERSION is omitted, defaults to the most recent stable version.

Arguments:
    --list                  Lists versions of the Partner Environment.
    -q, --quiet             Do not write command logs to STDOUT.
    -h, --help              Display this message.
```

### `$ placeos uninstall`

```shell-session
Usage: placeos uninstall

Removes PlaceOS containers, removes scripts from paths, and finally deletes the installation path.

Arguments:
    --force                 Skip confirmation of uninstall.
    -h, --help              Display this message.
```

## Service Graph

![Service graph for PlaceOS](/images/service-graph.png)
