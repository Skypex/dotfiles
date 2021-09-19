# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="spaceship"

# Would you like to use another custom folder than $ZSH/custom?
ZSH_CUSTOM="$HOME/dotfiles/custom"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    colored-man-pages
    dotenv
    git
    # Custom
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#
# Load profiles
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
