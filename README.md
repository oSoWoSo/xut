## xut : xtra user templates

Build and install packages for Void Linux, from the abyss-packages unofficial repo

**This script is in the alpha stage.**

### Why and how

The `xbps-src` package builder for voidlinux is a really powerful tool, but it only works with
a single repository, the void-packages repo. The only straightforward way to add software to repo
provide it in an accessible way to the users is to send PRs and be accepted.
That created a well-maintained and curated repository by the distribution developers but impedes
the inclusion of software that the same maintainers decide - for entirely valid reasons - to not accept.

`xut` tries to provide a solution for users that need more packages that cannot be provided in the
official repos. It clones both the void-packages and abyss-packages repository (and other third party repos),
 merges the templates from unofficial repos to the clone of void-packages and installs sw with a single command.

### Install and setup

1. Download, the `xut` script into the path and make it executable.
2. Use the xutconf.sample if you want to modify configuration.
3. The script depends on:
   - `sh`,
   - `xbps`,
   - `git`,
   - the `xi` tool from the _xtools_ package which requires a working `sudo` configuration,
   - the `tput` tool from _ncurses_.

### Todo

- [ ] Deal with shlibs in order to package more complex sw or modified packages from the upstream repos.
- [ ] Implement a way to handle upgrades gracefully.
- [x] Search for a practical way to enable more than one unofficial repos [**naive implementation merged from the manyrepos branch**]
- [ ] ... (suggestions are welcome, working code even more welcome)

### Usage

```shell
xut [options]
```

| OPTIONS                | Info                                                    |
| ---------------------- | ------------------------------------------------------- |
| -s                     | Sync the repos
| -l                     | Keep a log file (5 most recent log files remain)        |
| -h                     | Display this usage information.                         |
| -b <package1,package2> | Build a (comma-separated) list of packages.             |                               |
| -i <package1,package2> | Build and install a (comma-separated) list of packages. |
| -x                     | Give xbps-src commands.                                 |
                                     |


### Examples

- Build packages (without installing them):
```shell
xut -b package1,package2
```

- Sync repos and install packages with logging enabled: 
```shell
xut -sli package1,package2
```

- Execute an xbps-command in the merged repo:

```shell
xut -x <command>
```