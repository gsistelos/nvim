# nvim
My neovim configuration.

# Installation
1. **Neovim**
    * Debian based distros:
      ```sh
      sudo curl -fsSL https://github.com/neovim/neovim/releases/download/stable/nvim-linux-x86_64.appimage -o nvim.appimage
      chmod +x nvim.appimage
      sudo mv nvim.appimage /usr/bin/nvim
      ```
      Install fuse if needed:
      ```sh
      sudo apt install fuse
      ```
    * Arch based distros:
      ```sh
      sudo pacman -S --needed neovim
      ```
2. **Dependencies**
    * Debian based distros:
      ```sh
      sudo apt install git curl wget unzip make gcc clang ripgrep fd-find python3-venv python3-pip libssl-dev pkg-config
      ```
    * Arch based distros:
      ```sh
      sudo pacman -S --needed git curl wget unzip make gcc clang ripgrep fd python-virtualenv python-pip
      ```
    * nvm:
      ```sh
      curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NODE_VERSION=stable bash
      ```
3. **Clone configuration**
    ```sh
    git clone --depth=1 https://github.com/gsistelos/nvim.git ~/.config/nvim
    ```

## Docker

Run the configuration in a Arch container.
```sh
./dvim [/path/to/workdir]
```
