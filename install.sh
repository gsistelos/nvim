#!/usr/bin/env sh

RED="\033[1;31m"
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RESET="\033[0m"

SUCCESS="[${GREEN}SUCCESS${RESET}]"
INFO="[${BLUE}INFO${RESET}]"
WARNING="[${YELLOW}WARNING${RESET}]"
ERROR="[${RED}ERROR${RESET}]"


yn_question() {
	echo -n "$1 [Y/n] "
	read -r ANSWER

	case $ANSWER in
		[yY] | [yY][eE][sS] | "")
			return 0
			;;
		*)
			return 1
			;;
	esac
}


check_distro() {
	if [ ! -f /etc/os-release ]; then
		echo "${ERROR} /etc/os-release is not a regular file"
	fi

	if grep -q "ID=arch" /etc/os-release; then
		DISTRO="arch"
		echo "${INFO} Running script for Arch distro..."
	elif grep -q "ID=debian" /etc/os-release; then
		DISTRO="debian"
		echo "${INFO} Running script for Debian distro..."
	else
		echo "${ERROR} This script only supports Debian and Arch distros"
		exit 1
	fi

	if ! yn_question "Continue?"; then
		exit 0
	fi
}


install_packages() {
	if [ ${DISTRO} = "arch" ]; then
		UPDATE_PACKAGES="sudo pacman -Syu --noconfirm"
		INSTALL_PACKAGES="sudo pacman -S --needed --noconfirm git curl wget unzip make gcc clang ripgrep fd python-virtualenv python-pip"
	else
		UPDATE_PACKAGES="sudo apt update && sudo apt upgrade -y"
		INSTALL_PACKAGES="sudo apt install -y git curl wget unzip make gcc clang ripgrep fd-find python3-venv python3-pip"
	fi

	echo "${INFO} Updating packages..."
	if ! eval "${UPDATE_PACKAGES}"; then
		echo "${ERROR} Failed to update packages"
		exit 1
	fi

	echo "${INFO} Installing packages..."
	if ! eval "${INSTALL_PACKAGES}"; then
		echo "${ERROR} Failed to install packages"
		exit 1
	fi
}


install_neovim() {
	echo "${INFO} Installing neovim..."

	if [ ${DISTRO} = "arch" ]; then
		if ! sudo pacman -S --needed --noconfirm neovim; then
			echo "${ERROR} Failed to install neovim"
			exit 1
		fi
	else
		echo "${INFO} Installing neovim..."
		if ! curl -fLO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage; then
			echo "${ERROR} Failed to curl nvim-linux-x86_64.appimage"
			exit 1
		fi

		chmod +x nvim-linux-x86_64.appimage
		sudo mv nvim-linux-x86_64.appimage /usr/bin/nvim
	fi
}


clone_neovim_config() {
	echo "${INFO} Cloning neovim configuration..."
	if ! git clone --depth=1 https://github.com/gsistelos/nvim.git ~/.config/nvim; then
		echo "${ERROR} Failed to clone neovim configuration"
		exit 1
	fi
}


check_distro
install_packages
install_neovim
clone_neovim_config
