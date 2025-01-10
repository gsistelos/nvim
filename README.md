# nvim

## Install

### Neovim

Debian based distros:

```
sudo curl -fsSLO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim
```

Arch based distros:

```
sudo pacman -S --needed neovim
```

Run the configuration in a Arch container:

```
docker image build -t nvim .
./dvim [/path/to/directory]
```

### Configuration

```bash
git clone --depth=1 https://github.com/gsistelos/nvim.git ~/.config/nvim
```

## Dependencies

### Packages

Debian based distros:

```bash
sudo apt install git curl wget gcc clang make unzip ripgrep fd-find python3-venv python3-pip
```

Arch based distros:

```bash
sudo pacman -S --needed git curl wget gcc clang make unzip ripgrep fd python-virtualenv python-pip
```

### nvm

```bash
curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/master/install.sh | NODE_VERSION=stable bash
```
