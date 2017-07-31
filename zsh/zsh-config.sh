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

# Installing Oh My Zsh
showSubSection "Configuring Oh My Zsh";
if [[ ! -d "$ZSH" ]]; then
	printf "$(pad "Installing $(ansi --green \"Oh-my-zsh\")")";
	$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash &>/dev/null);
	showResultOrExit;
	# Restore ZSH config
	if [ -e "$HOME/.zshrc.pre-oh-my-zsh" ]; then
		mv "$HOME/.zshrc.pre-oh-my-zsh" "$HOME/.zshrc";
	fi
fi

# Add pure theme to oh-my-zsh
printf "$(pad "Adding $(ansi --green \"Pure\") theme")";
ln -sf "$ZSH_LIB/pure.zsh" $ZSH_CUSTOM/pure.zsh-theme && ln -sf "$ZSH_LIB/async.zsh" $ZSH_CUSTOM/async.zsh
showResult

# Install zsh-syntax-highlighting
printf "$(pad "Adding $(ansi --green \"ZSH Syntax Highlighting\")")";
ln -sf "$ZSH_LIB/zsh-syntax-highlighting" $ZSH_CUSTOM/plugins/
showResult

# Install zsh-autosuggestions
printf "$(pad "Adding $(ansi --green \"ZSH Auto Suggestions\")")";
ln -sf "$ZSH_LIB/zsh-autosuggestions" $ZSH_CUSTOM/plugins/
showResult

addInstallNote "+Remember to add \"$(which zsh)\" to /etc/shells\n+Use chsh -s $(which zsh) to change your login shell";
