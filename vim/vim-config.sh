#!/usr/bin/env bash

####################################################################################
# vim-config.sh
# -------------
#
# Perform additional VIM configuration
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

showSection "Performing VIM customization";

# Installing vim-plug + plugins 
showSubSection "Configuring vim-plug";
if [[ ! -e "$HOME/.vim/autoload/plug.vim" ]]; then
	printf "$(pad "Installing $(ansi --green \"vim-plug\")")";
	$(curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim &>/dev/null);
	showResultOrExit;
fi

if [ -d "$HOME/.vim/plugged" ]; then
	printf "$(pad "Cleaning previous vim-plug plugins $(ansi --green \"vim-plug\")")";
	rm -fr "$HOME/.vim/plugged"
	showResultOrExit
fi
printf "$(pad "Installing $(ansi --green "\"VIM plugins\"")")";
vim -u $SCRIPT_DIR/vimrc.install +PlugInstall +qa &> /dev/null
showResultOrExit
