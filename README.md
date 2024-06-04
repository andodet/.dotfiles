# Post install scripts and configs

This repo contains config files and a script to restore a clean Fedora install.

## Usage

To refresh **all** the config files currently in use, run:

```sh
sh ./sync_settings.sh
```

Restore all config files with the following command

```sh
sh ./run.sh
```

The command above will:

1. Install all relevant libraries and software.
2. Copy config files where they belong.
