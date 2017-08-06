#!/usr/bin/env bash

####################################################################################
# install_osx.sh
# --------------
#
# Performs Mac OS X specific installation stuff (Brew, System Tweaks, Fonts, etc...)
#
####################################################################################

# Globals
#########
MAC_MAIN=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
BASH_MAIN="$MAC_MAIN/../bash";
BREW_MAIN="$MAC_MAIN/../brew";

# Imports
###########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh
source $BREW_MAIN/brew.sh

########### MAIN ################

# Dependencies Management
loadBashLibs;

# Install Homebrew packages
showSection "Mac OS X installation";
if [[ ! $SKIP_BREW -eq 1 ]]; then
	installBrewPackages;
else
	printf "\n$(pad "$(ansi --yellow "Skipping Brew")")$(ansi --yellow "$RES_WARN")";
fi

# -> Rest of Mac OS X Custom Stuff

# Use Figlet fonts in Toilet (Homebrew)
printf "\n$(pad "Linking $(ansi --green "\"Toilet\"") fonts")";
find $(figlet -I2) | egrep -i ".flc$|.flf$" | xargs -I{} ln -sf {} $(toilet -I2) &>/dev/null
showResult;

# Install SF Mono Fonts
printf "$(pad "Adding $(ansi --green "\"SF Mono\"") fonts")";
cp -v /Applications/Utilities/Terminal.app/Contents/Resources/Fonts/SFMono-* ~/Library/Fonts &>/dev/null
showResult

# Setting brew nvm in HOME
printf "$(pad "Linking $(ansi --green "\"NVM\"")")";
if [  -e "/usr/local/opt/nvm/nvm.sh" ] && [ ! -e "$HOME/.nvm/nvm.sh" ]; then
	ln -s "/usr/local/opt/nvm/nvm.sh" ~/.nvm/nvm.sh
fi
showResult

# Setting brew fzf in HOME
printf "$(pad "Linking $(ansi --green "\"FZF\"")")";
if [ ! -e "$HOME/.fzf" ]; then
	FZF_DIR=$(dirname $(readlink -f $(which fzf)))"/../";
	ln -s $FZF_DIR $HOME/.fzf
fi
showResult
