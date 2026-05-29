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
	echo -n "${1} [Y/n] "
	read -r ANSWER

	case "${ANSWER}" in
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
		exit 1
	fi

	local distros="Arch Ubuntu Debian"

	for distro in ${distros}; do
		local lowercase_distro="$(echo "${distro}" | tr "A-Z" "a-z")"

		echo "${INFO} Checking for ${distro} distro..."

		if grep -q "ID=${lowercase_distro}" /etc/os-release; then
			DISTRO="${distro}"
			echo "${INFO} Running script for ${distro} distro..."
			break
		fi
	done

	if [ -z "${DISTRO}" ]; then
	    local distros_str="$(echo "${distros}" | sed -E 's/ /, /g; s/, ([^,]*)$/ and \1/')"
		echo "${ERROR} This script only supports ${distros_str} distros"
		exit 1
	fi

	if ! yn_question "Continue?"; then
		exit 0
	fi
}


install_packages() {
	if [ "${DISTRO}" = "Arch" ]; then
		UPDATE_PACKAGES="sudo pacman -Syu --noconfirm"
		INSTALL_PACKAGES="sudo pacman -S --needed --noconfirm base-devel git curl wget unzip make gcc clang ripgrep fd python-virtualenv python-pip"
	elif [ "${DISTRO}" = "Ubuntu" ] || [ "${DISTRO}" = "Debian" ]; then
		UPDATE_PACKAGES="sudo apt update && sudo apt upgrade -y"
		INSTALL_PACKAGES="sudo apt install -y build-essential git curl wget unzip make gcc clang ripgrep fd-find python3-venv python3-pip pkg-config libssl-dev"
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

	if [ "${DISTRO}" = "Arch" ]; then
		if ! sudo pacman -S --needed --noconfirm neovim; then
			echo "${ERROR} Failed to install neovim"
			exit 1
		fi
	elif [ "${DISTRO}" = "Ubuntu" ] || [ "${DISTRO}" = "Debian" ]; then
		local app_image="nvim-linux-x86_64.appimage"

		echo "${INFO} Installing neovim..."
		if ! curl -fLO https://github.com/neovim/neovim/releases/latest/download/${app_image}; then
			echo "${ERROR} Failed to curl ${app_image}"
			exit 1
		fi

		chmod +x "${app_image}"
		sudo mv "${app_image}" /usr/bin/nvim
	fi
}


clone_neovim_config() {
	echo "${INFO} Cloning neovim configuration..."
	if ! git clone --depth=1 https://github.com/gsistelos/nvim.git ~/.config/nvim; then
		echo "${ERROR} Failed to clone neovim configuration"
	fi
}


check_distro
install_packages
install_neovim
clone_neovim_config
