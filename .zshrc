# Path to your oh-my-zsh installation.
export ZSH=/Users/maxime/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="okqq"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/sbin"
# export MANPATH="/usr/local/man:$MANPATH"
export EDITOR='vim'

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# configuration aliases
alias zshrc="vi ~/.zshrc"
alias zshrcs="source ~/.zshrc"
alias vimrc="vi ~/.vimrc"
alias vimrcs="source ~/.vimrc"
alias gitrc="vi ~/.gitconfig"

# utility aliases
alias tm="tmux"
alias tmd="tmux detach"
alias tmk="tmux kill-server"
alias tmt="tmux attach -t"
alias pm2k='pm2 kill'

# function aliases
gin() { echo "$*" >> .gitignore; }

# copy ssh configuration to buffer
alias copyssh="less ~/.ssh/id_rsa.pub | pbcopy"

# SSH alias
alias qostatsdev="ssh administrator@192.168.0.74"
alias qostatsstag="ssh administrator@192.168.0.180"
alias qostatsprod="ssh administrator@192.168.0.107"
alias qostatsweb="ssh administrator@192.168.0.106"
alias qogstatsweb="ssh qualifio@192.168.0.127"
alias qredis="ssh administrator@192.168.0.100"
alias qgate-1="ssh administrator@192.168.0.102"
alias qgate-2="ssh administrator@192.168.0.103"
alias qgate-3="ssh administrator@192.168.0.104"
alias qgate-4="ssh administrator@192.168.0.105"
alias qvarnishtest="ssh administrator@192.168.0.108"
alias qgstats-1="ssh administrator@192.168.0.128"

alias qstats-dev="ssh administrator@192.168.0.74"
alias qstats-1="ssh administrator@192.168.0.141"
alias qstats-2="ssh administrator@192.168.0.142"

export NVM_DIR="/Users/maxime/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/base16-default.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

preexec_functions=()

function expand_aliases {
  input_command=$1
  expanded_command=$2
  if [ $input_command != $expanded_command ]; then
    print -nP $PROMPT
    echo $expanded_command
  fi
}
preexec_functions+=expand_aliases

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export PATH="$HOME/.yarn/bin:$PATH"
