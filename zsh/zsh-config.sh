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

# Download Pure
showSection "Performing ZSH customization";
loadZshLibs;

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

printf "$(pad "Adding $(ansi --green \"Pure\") theme")";

# Add pure theme to oh-my-zsh
ln -sf "$ZSH_LIB/pure.zsh" ~/.oh-my-zsh/custom/pure.zsh-theme && ln -sf "$ZSH_LIB/async.zsh" ~/.oh-my-zsh/custom/async.zsh
showResult

# Uncomment to load pure without oh-my-zsh
#ln -sf "$ZSH_MAIN/pure.zsh" "$FPATH_TARGET/prompt_pure_setup" && ln -sf "$ZSH_MAIN/async.zsh" "$FPATH_TARGET/async";

addInstallNote "+Remember to add \"$(which zsh)\" to /etc/shells\n+Use chsh -s $(which zsh) to change your login shell";
