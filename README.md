# dotfiles

Here are my `dotfiles` that I currently use in combination with the following tools:

* [WSL v2](https://docs.microsoft.com/en-us/windows/wsl/install-win10)
* [Windows Terminal](https://github.com/microsoft/terminal)
* [Visual Studio Code](https://code.visualstudio.com/)

## Setup

The setup assumes you have done a `git clone --recursive` of the `dotfiles` repo into your home directory.

```bash
# Backup old config
mv .zshrc .zshrc.backup
# Symlink new config
ln -s dotfiles/zshrc .zshrc
```

In order to make the terminal usable you need to install the font [Source Code Pro for Powerline](https://github.com/powerline/fonts/tree/master/SourceCodePro).

## Update custom plugins

Custom plugins are included via `git submodules` - in order to update them you just need to fetch the submodules:

```bash
git submodule update --remote --merge --recursive
```
