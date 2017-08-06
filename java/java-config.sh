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

showSection "Performing Java Customization";

# Installing vim-plug + plugins 
showSubSection "Installing JVM tools";
if [[ ! -e "/usr/local/sdkman" ]]; then
	printf "$(pad "Installing $(ansi --green \"SDKMAN\!\")")";
	export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash &>/dev/null
	showResultOrExit;
fi

#showSubSection "Installing VIM plugins";
#showResult

