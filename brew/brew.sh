#!/usr/bin/env bash

####################################################################################
# homebrew.sh
# -----------
#
# Installs Homebrews and dependencies
#
####################################################################################

# Globals
#########

BREW_MAIN=$(cd "$(dirname ${BASH_SOURCE[0]})"; pwd);
BASH_MAIN="$BREW_MAIN/../bash";
BREW_PACKS="$BREW_MAIN/brew.pack";

# Imports
###########
source $BASH_MAIN/bash_common.sh
source $BASH_MAIN/bash_deps.sh

# Functions
#############

###################################
# Shows a heading section
# Params:
# - (1) section : Section's name
###################################
function hasBrew() {
	[[ -n "$(which brew)" ]] && return 0 || return 1;
}

###################################
# Creates a Homebrew Brewfilw
# containing the current installed
# taps and installed packages
# Params:
# - (1) file : Optional name of
#              the output brew file
###################################
function createBrewFile() {
	local brewFile=${1:-""};
	[[ -n "$brewFile" ]] && brewFile="--file=$brewFile";
	if hasBrew; then
		brew bundle dump $brewFile;
	fi
}

###################################
# Checks if the given brew package
# is installed
# Params:
# - (1) package : Brew package name
###################################
function checkBrewPackage() {
	local brewPack=${1};
	local pack_version="";
	if hasBrew; then
		pack_version=$(brew ls --versions "$brewPack" 2>/dev/null);
	fi
	[[ $? -eq 0 && -n "$pack_version" ]] && return 0 || return 1;
}

########################################
# Installs Brew Packages from
# the given Brewfile dump
# Params:
# - (1) brewfile : Path to the brewfile
########################################
function installBrewPackages() {
	# Check Homebrew installation
	if ! hasBrew; then
		printf "$(pad "Installing $(ansi --green "[Homebrew]")")";
		ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
		showResultOrExit;
	fi

	# Make sure we’re using the latest Homebrew.
	printf "$(pad "Updating $(ansi --green "Homebrew")")";
	brew update &>/dev/null
	showResult

	# Upgrade any already-installed formulae.
	printf "$(pad "Upgrading $(ansi --green "Homebrew") packages")";
	brew upgrade &>/dev/null
	showResult

	# Get Homebrew taps
	local BREW_TAPS=($(brew tap 2>/dev/null));

	# Download and installl brew packages from the brew file
	while read line; do
		read -ra brew_data <<< "$line"
		regex="^[:space:]*(brew|tap) '(.+)'(, args: \[(.+)\]){0,1}";
		if [[ $line =~ $regex ]]; then
			local type=${BASH_REMATCH[1]};
			local name=${BASH_REMATCH[2]};
			local args=${BASH_REMATCH[4]};

			# Process Brew package and install if not present
			if [[ $type == "brew" ]]; then
				printf "$(pad "Installing \"$(ansi --blue "$name")\"")";
				if ! checkBrewPackage "$name"; then
					local pack_args="";

					# Read  multiple args
					local OLD_IFS=IFS; IFS=',' read -ra p_args <<< "$args"; IFS=$OLD_IFS;

					# Trim whitespaces
					shopt -s extglob
					for p in "${p_args[@]}"; do
						p="--${p##*( )}";
						p="${p//\'}";
						pack_args=${pack_args}" "${p};
					done
					pack_args="${pack_args##*( )}";
					shopt -u extglob
					brew install $name $pack_args &>/dev/null
					showResult;
				else
					printf "$(ansi --yellow "[Already Installed]")\n";
				fi
			elif [[ $type = "tap" ]]; then
				# Add brew tap only if not already present
				if ! arrayContains BREW_TAPS "$name"; then
					printf "$(pad "Adding tap \"$(ansi --green "$name")\"")";
					brew tap $name &>/dev/null;
					showResult;
				fi
			fi

		fi
	done < $BREW_PACKS
}
