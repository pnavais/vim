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

# Imports
###########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

########### MAIN ################

showBanner;

# Dependencies Management
showSection "Performing BASH customization";
loadBashLibs;

# Create symlinks for all .symlink files/directories in $HOME
showSubSection "Creating symlinks";
createLinks "$(find $SCRIPT_DIR/ -name "*.symlink")";

# Install Homebrew packages (OS X)
if isOSX; then
	$OSX_MAIN/install_osx.sh;
fi

addInstallNote "Notes: ";

# Perform specific tools post-install config
for config in $(find $SCRIPT_DIR/ -name *-config.sh); do
	source $config;
done

# Print available Notes
addInstallNote "\nInstallation Finished.";
printNotes;

printf $(toilet -f pagga "That's all Folks !")"\n\n" | lolcat; 
