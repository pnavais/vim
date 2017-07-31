#!/usr/bin/env bash

####################################################################################
# install.sh
# ----------
#
# Downloads all needed dependencies and makes symlinks of all dot files in $HOME.
#
####################################################################################

# Globals
#########
VERSION="1.0.0";
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
BASH_MAIN="$SCRIPT_DIR/bash";
OSX_MAIN="$SCRIPT_DIR/mac";
BREW_MAIN="$SCRIPT_DIR/brew";
SKIP_BREW=0;

# Imports
###########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

# Functions
###########

function show_help() {
	printf "Payball's Dotfiles Installer\n\n";
	printf "Usage : $(basename $0) <OPTIONS>\n";
	printf "where OPTIONS are :\n";
	printf "\t--skip-brew : show version\n";
	printf "\t-v          : show version\n";
	printf "\t-h          : show this help\n";
}

########### MAIN ################


# Parse options
for arg in "$@"
do
	case $arg in
		-h|--help)
			show_help;
			exit 0;
			;;
		-v|--version)
			printf "v$VERSION\n";
			exit 0;
			;;
		--skip-brew)
			SKIP_BREW=1;
			shift
			;;
		--default)
			shift # past argument with no value
			;;
		*)
			# unknown option
			printf "Invalid option: $arg\n" >&2
			exit -1;
			;;
	esac
done

showBanner;

# Dependencies Management
showSection "Performing BASH customization";
loadBashLibs;

# Install Homebrew packages (OS X)
if isOSX; then
	. $OSX_MAIN/install_osx.sh;
fi

# Create symlinks for all .symlink files/directories in $HOME
showSubSection "Creating symlinks";
createLinks "$(find $SCRIPT_DIR/ -name "*.symlink")";

addInstallNote "Notes: ";

# Perform specific tools post-install config
for config in $(find $SCRIPT_DIR/ -name *-config.sh); do
	source $config;
done

# Print available Notes
addInstallNote "\nInstallation Finished.";
printNotes;

showExitMsg;
