# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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
plugins=(git colorize colored-man-pages last-working-dir vi-mode )


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi


#OWN USER CONFIG BC I KNOW BETTER LOL

# Colors
(cat ~/.cache/wal/sequences &)

# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle :compinstall filename '/home/factor/.zshrc'

# sourcing plugins installed with pacman or written myself

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /etc/profile.d/autojump.zsh
source /usr/share/zsh/plugins/zsh-autopair/autopair.zsh
source ~/.bin/transfer.sh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
[[ -s /etc/grc.zsh ]] && source /etc/grc.zsh
source /usr/share/doc/pkgfile/command-not-found.zsh

# source oh-my-zsh late, fixes some issues with plugins
source $ZSH/oh-my-zsh.sh


# Keybindings for history-substring-search


bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down


bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# load zsh-completions
# fpath=()

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd extendedglob nomatch
unsetopt beep notify
bindkey -v
# End of lines configured by zsh-newuser-install



# Custom prompt

ZSH_THEME_GIT_PROMPT_PREFIX="%F{242}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f"
ZSH_THEME_GIT_PROMPT_DIRTY="±"
ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE="⇣"
ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE="⇡"


git_status() {
  echo -n "$(git_prompt_status)$(git_prompt_info)"
}

dir_status() {
  echo -n "%F{green}"
}

PROMPT="%(?.%F{white}.%F{red})>>%f  "
RPROMPT='%n@%M:%F{green}%~%f $(git_status)'

# Cursor styling
# The cursor matches the behavior of vim

MODE_CURSOR_VIINS="blinking bar"
MODE_CURSOR_REPLACE="$MODE_CURSOR_VIINS "
MODE_CURSOR_VICMD="block"
MODE_CURSOR_SEARCH="steady underline"
MODE_CURSOR_VISUAL="$MODE_CURSOR_VICMD steady bar"
MODE_CURSOR_VLINE="$MODE_CURSOR_VISUAL"


# Environment Variables

export PATH=~/.bin:$PATH
export PATH=~/.cargo/bin:$PATH
export EDITOR=nvim
export TERM=rxvt-unicode-256color
export TERMCMD=urxvt
export CLASSPATH="/usr/share/java/*:"

# export GOPATH=$HOME/code/go
# export PATH=$PATH:$(go env GOPATH)/bin

# Aliases

# alias ls='ls --color=auto'
alias ls='exa --group-directories-first '
alias ll='exa --group-directories-first -l --git'
alias la='exa --group-directories-first -la --git'
alias lt='exa -T'

alias pika='pikaur'
alias less='lesspipe.sh'

alias vim='nvim'
alias svim='sudoedit'
alias v='nvim'
alias sv='sudoedit'

alias gcal='gcalcli --calendar juliusschumacher@gmail.com'
alias weather='curl wttr.in/gothenburg'

alias ghci='stack ghci'
alias haskell='stack runghc'
alias py='python'


alias videos='~/media/videos'
alias color-picker=com.github.ronnydo.colorpicker
export XDG_CONFIG_HOME="$HOME/.config"

# environment vars for wsl2
export HOST_IP="$(ip route | awk '/^default/{print $3}')"

export PULSE_SERVER="tcp:$HOST_IP"

#export DISPLAY="$HOST_IP:0"
export DISPLAY=":0"
