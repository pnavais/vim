#!/usr/bin/env bash

####################################################################################
# java-config.sh
# --------------
#
# Perform additional Java configuration
#
####################################################################################

# Globals
#########
SCRIPT_DIR=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
BASH_MAIN="$SCRIPT_DIR/../bash";

# Functions
###########

# Imports
##########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

showSection "Performing Terminal Customization";

# Tunning Terminfo
showSubSection "Updating Terminfo database";
#if isOSX; then
	printf "$(pad "Installing $(ansi --green \"Terminfo\ profiles\")")";
	tic -x $SCRIPT_DIR/xterm-256color-italic.terminfo &&
	tic -x $SCRIPT_DIR/tmux-256color.terminfo
    showResultOrExit;
#fi
