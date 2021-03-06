# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

# appends history between sessions
setopt appendhistory

# move to folder without appending 'cd'
setopt autocd

# extends glob expansion, which makes navigation easier
setopt extendedglob

# sends error when no match occurs
setopt nomatch

# turns off beeping on error
unsetopt beep

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/abilson/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Begin custom configurations from optional files

# env file required to define config workdir
if [[ ! -f ~/.zsh_env ]]; then
  echo "No env vars detected at ~/.zsh_env; creating template..."
  echo "#!/bin/sh
export CONFIG_PATH=~/source/config/acbilson
" > ~/.zsh_env
fi

source ~/.zsh_env

if [[ ! -d "$CONFIG_PATH" ]]; then
  echo "\$CONFIG_PATH path: $CONFIG_PATH does not exist. Ending zsh customization..." && return 0
fi

<<<<<<< HEAD:zsh/.zshrc
if [[ ! -f "$CONFIG_PATH/.zsh_aliases" ]]; then
  echo "Aliases are not available. Skipping..."
=======
if [ -f ~/.zsh_functions ]; then
    . ~/.zsh_functions

    # runs the lastyear func, which displays last year's memoir (if it exists)
    lastyear
>>>>>>> 52c85c8... makes zsh folder more robust:zsh/zshrc
fi

if [[ ! -f "$CONFIG_PATH/.zsh_functions" ]]; then
  echo "Functions are not available. Skipping..."
=======

# theme definitions
if [ -f ~/.zsh_theme ]; then
    . ~/.zsh_theme
fi
#
# ssh keys
if [ -f ~/.ssh/git_rsa ]; then
    ssh-add ~/.ssh/git_rsa
fi

# auto loads ssh keys (if keychain is available)
if [ -x "$(command -v keychain)" ]; then
	eval `keychain --agents ssh --eval git_rsa`
fi

# sets editor to vim (if vim exists)
if [ -x "$(command -v vim)" ]; then
	export EDITOR=/usr/bin/vim
fi
=======
# End custom configurations from optional files
# Begin custom paths
export PATH="$PATH:$HOME/.local/bin"
# End custom paths

# Begin Docker configurations

# bind the C:/ drive to a new mount point
# WINDOWS ONLY
#export DOCKER_HOST=tcp://localhost:2375
#mkdir -p /c && sudo /bin/mount --bind /mnt/c /c

# End Docker configurations
