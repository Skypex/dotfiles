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
