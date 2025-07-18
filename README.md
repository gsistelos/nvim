# nvim

My Neovim configuration.

# Installation

1. **Install Neovim and dependencies**

    Run the installation script: `./install.sh`.

3. **Clone configuration**
    ```sh
    git clone --depth=1 https://github.com/gsistelos/nvim.git ~/.config/nvim
    ```

# Post-install

Check `lua/plugins/nvim-lspconfig.lua`, there is a commented list of LSPs.

Some LSPs may require node, I recommend installing with [fnm](https://github.com/Schniz/fnm).
