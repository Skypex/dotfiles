# dotfiles

## Setup

The setup assumes you have done a `git clone` of the `dotfiles` repo into your home directory.

```bash
# Install zsh
sudo apt update
sudo apt install zsh curl
# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Change the default shell to zsh
chsh -s $(which zsh)
# Backup old config
mv .zshrc .zshrc.backup
# Symlink new config
ln -s dotfiles/zshrc .zshrc
```


https://github.com/powerline/fonts/tree/master/SourceCodePro 
`Source Code Pro for Powerline.otf`



# Dotfiles

Here are my `dotfiles` that I use for my work laptop.
Current setup uses the following tools:

* [WSL v2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Windows Terminal](https://github.com/microsoft/terminal)
* [Visual Studio Code](https://code.visualstudio.com/)

## Installation

> **NOTE:**  This section is not finished and not tested!

```sh
ln -s dotfiles/zshrc .zshrc
```

Font

[Powerline Fonts](https://github.com/powerline/fonts)

Update Sub-modules

```sh
git submodule update --remote --merge
```
