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

1. Clone this repo, change into the `xut/` subdirectory and install using the Makefile.
2. Use the xutconf.sample if you want to modify configuration.
3. The script depends on:
   - `sh` and the  posix userland,
   - `xbps`,
   - `git`,
   - `mktemp`,
   - the `xi` tool from the _xtools_ package which requires a working `sudo` configuration,
   - the `tput` tool from _ncurses_ (optional).

	Note that xut will run in other distributions that have sh, posix userland, git and sort -V available,
	but installing (-i) and upgrading (-u) packages is disabled.
### Todo

- [ ] Deal with shlibs in order to package more complex sw or modified packages from the upstream repos.
- [x] Implement a way to handle package updates gracefully. [**-u argument**]
- [x] Search for a practical way to enable more than one unofficial repos ~[**naive implementation merged from the manyrepos branch**]~
(Inteligent merging by @zenobit available from 0.4.0).
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
| -x <command>           | Give xbps-src commands.                                 |
| -q <query>             | Search for <query> in available templates.              |
| -u                     | Update packages.							               |
                                     |


### Examples

- Update packages after syncing repos:

```shell
xut -su
```

clitest
```shell
$ xut -su                  #=> --egrep ^Checking for updatable packages|No updates available
```

- Build packages (without installing them):
```shell
xut -b package1,package2
```

clitest
```shell
$ xut -b vpm,fzf           #=> --egrep Successfully build vpm,fzf!
```

- Sync repos and install packages:
```shell
xut -si package1,package2
```

clitest
```shell
$ yes | xut -si vpm,fzf          #=> --exit 0
$ command -v vpm
/usr/bin/vpm
$ command -v fzf
/usr/bin/fzf
$
```

- Use the above command with logging enabled:
```shell
xut -sli package1,package2
```

clitest
```shell
$ yes | xut -sli vsv,fastfetch   #=> --egrep vsv,fastfetch installed
$ command -v vsv
/usr/bin/vsv
$ fastfetch                #=> --egrep OS: Void Linux
```

- Execute an xbps-command in the merged repo:

```shell
xut -x <command>
```

clitest
```shell
$ xut -x -V                #=> --egrep ^xbps-src|XBPS|API|GIT
```
