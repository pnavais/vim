#!/usr/bin/env bash

####################################################################################
# zsh-config.sh
# -------------
#
# Perform additional ZSH configuration
#
####################################################################################

# Globals
#########
ZSH_MAIN=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
ZSH_LIB="$ZSH_MAIN/lib";
ZSH_DEPS="$ZSH_MAIN/zsh.pack";
BASH_MAIN="$ZSH_MAIN/../bash";
BASH_LIB="$BASH_MAIN/lib";
FPATH_TARGET="/usr/local/share/zsh/site-functions/";
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
ZPLUG_INSTALLER="zplug-installer.zsh"

# Functions
###########

###################################
# Retrieves all external libs and
# keep them in the given directory
###################################
function loadZshLibs() {
	downloadLibs "$ZSH_LIB" "$ZSH_DEPS";
}

ZSH_CMD=$(command -v zsh);

# Imports
##########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

# Dependencies Management
loadBashLibs;

showSection "Performing ZSH customization";
loadZshLibs;

# Install zplug
if [ -d "$HOME/.zplug" ]; then
	printf "$(pad "Uninstalling previous $(ansi --green \"Zplug\")")";
	rm -fr $HOME/.zplug
	showResultOrExit
fi

printf "$(pad "Installing $(ansi --green \"Zplug\")")";
[ -e "$SCRIPT_DIR/lib/$ZPLUG_INSTALLER" ] && chmod +x $SCRIPT_DIR/lib/$ZPLUG_INSTALLER
$SCRIPT_DIR/lib/$ZPLUG_INSTALLER &> /dev/null
showResultOrExit

if [ -n "$ZSH_CMD" ]; then
	addInstallNote "+Remember to add \"$(which zsh)\" to /etc/shells\n+Use chsh -s $(which zsh) to change your login shell";
fi
