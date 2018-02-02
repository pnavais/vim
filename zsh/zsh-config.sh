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
ZSH_CUSTOM="$HOME/.oh-my-zsh/custom";
ANTIGEN_CUSTOM="$HOME/.antigen/";
BASH_MAIN="$ZSH_MAIN/../bash";
BASH_LIB="$BASH_MAIN/lib";
FPATH_TARGET="/usr/local/share/zsh/site-functions/";

# Functions
###########

###################################
# Retrieves all external libs and
# keep them in the given directory
###################################
function loadZshLibs() {
	downloadLibs "$ZSH_LIB" "$ZSH_DEPS";
}

# Imports
##########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

# Dependencies Management
loadBashLibs;

showSection "Performing ZSH customization";
loadZshLibs;

# Create directories
mkdir -p $ZSH_CUSTOM $ANTIGEN_CUSTOM

# Create Antigen link
printf "$(pad "Creating $(ansi --green \"Antigen\") link")";
ln -sf "$ZSH_LIB/antigen.zsh" $ANTIGEN_CUSTOM/antigen.zsh
showResult

addInstallNote "+Remember to add \"$(which zsh)\" to /etc/shells\n+Use chsh -s $(which zsh) to change your login shell";
