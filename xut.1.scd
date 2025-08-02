XUT(1)

# NAME

*xut* - install software for void-linux using unofficial *x*tra *u*ser *t*emplates.

# SYNOPSIS

*xut* [-lsh] [-b _packages1,package2,..._ | -i _packages1,package2,..._] [-x <xbps-src command>]

# DESCRIPTION

The xut utility used unofficial user-provided templates for xbps-src in git repos to provide
additional software for a void-linux installation. 

# OPTIONS

*-s*	
	Sync the configured repositories.

*-l*
	Enable logging to a file.

*-h*
	Display usage information.


*-b <package1,package2>*
	Build a list of (comma-seperated) packages.

*-i <package1,package2>*
	Build and install a list of (comma-seperated) packages.
		
*-x* 
	Executed xbps-src commands.
	
*-q* <query>
	Search for <query> in available templates.
	
*-u*
	Update packages.
	

## Notes for cli arguments
	- If *-x* is used, *-b* and *-p* will be ignored.
	- *-b* and *-i* cannot be used in the same command.
	- *-l* and *-s* are meant to be used with the other arguments (*-x,*, *-b* and *-i*).
	- *-l* enables "debug" messages in the output, which becomes more verbose.

# CONFIGURATION

	*xut* has very limited configuration.
	By default it clones and syncs the void-packages repository and the abyss-packages from codeberg
	and uses the templates of the second one to build and install additional packages.
	It can be used without any additional configuration, but it can be configured by a _.xutconf_ file.
	Please see the sample configuration in _/usr/share/doc/xutconf.sample_ for more.
	By default, *xut* uses the _$HOME/.xut_ directory as a working directory. It clones and syns repos there, keeps logs
	if the user enables that with the *-l* arguments in the log/ subdirectory.
	

# EXAMPLES

	- Build packages (without installing them):
		'xut -b package1,package2'	
	- Sync repos and install packages:
		'xut -si package1,package2'	
	- Use the above command with logging enabled:
		'xut -sli package1,package2'		
	- Execute an xbps-command in the merged repo:
		'xut -x <command>'
	- Update packages after syncing repos:
		'xut -su'


# AUTHORS

Maintained by mobinmob <mobinmob@disroot.org>. Up-to-date sources can be found at
https://codeberg.org/mobinmob/xut and bugs/patches can be submitted there.