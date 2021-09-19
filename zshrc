
#
# ZSH configuration
#

# Path to oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Enable theme
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Define custom folder path
ZSH_CUSTOM="$HOME/dotfiles/custom"

# Enable plugins
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
    colored-man-pages
    dotenv
    # Custom
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# Finally load oh-my-zsh
source $ZSH/oh-my-zsh.sh


#
# Profiles
#
[ -f $ZSH_CUSTOM/profiles/work.zsh ] && source $ZSH_CUSTOM/profiles/work.zsh
[ -f $ZSH_CUSTOM/profiles/desktop.zsh ] && source $ZSH_CUSTOM/profiles/desktop.zsh


#
# General configuration
#

# General aliases
[ -f $ZSH_CUSTOM/aliases/general_aliases ] && source $ZSH_CUSTOM/aliases/general_aliases

# Go PATH setup
export PATH=$PATH:/usr/local/go/bin
