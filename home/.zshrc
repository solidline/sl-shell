# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="zhann"
# ZSH_THEME="jtriley"
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git mvn zsh-syntax-highlighting history-substring-search mouse colorize osx common-aliases cp gitignore node rbenv)
# plugins=(git mvn zsh-syntax-highlighting history-substring-search mouse colorize vi-mode osx common-aliases cp gitignore node rbenv)

bindkey -M viins 'jj' vi-cmd-mode

# sourcing the opp file, provides text-objects
# source ~/.homesick/repos/sl-shell/opp.zsh/opp.zsh
# source ~/.homesick/repos/sl-shell/opp.zsh/opp/*


# Added key bindings for vi-mode
bindkey '^P' up-history
bindkey '^N' down-history

# backspace and ^h working even after
# returning from command mode
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char

# ctrl-w removed word backwards
bindkey '^w' backward-kill-word

# ctrl-r starts searching history backward
bindkey '^r' history-incremental-search-backward

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source $HOME/.zsh/aliases
source $HOME/.zsh/zsh_aliases
source $HOME/Dropbox/shell/private

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# local bin
export PATH=/usr/local/bin:$PATH:~/.bin

# Splunk
export PATH=$PATH:/usr/local/bin/splunk/bin

# npm bin
export PATH=$PATH:/usr/local/share/npm/bin

# tmux
export PATH=$PATH:/Users/tadsanden/.homesick/repos/sl-shell/tmux-mem-cpu-load

# python pip module
# see http://nojhan.github.io/colout/ for examples on adding color to the terminal
export PATH=$PATH:/usr/local/share/python

export EDITOR='vim'

# sbt
export PATH=$PATH:/Users/tadsanden/code/sbt

# custom cdpaths
cdpath=($HOME/repos)

# boost the maven memory, useful for when running  jetty
# -Xmx512m
# export MAVEN_OPTS="-Duser.timezone=UTC -Xmx1512m -XX:MaxPermSize=1256m -Xss4m -Xss5024k"
export MAVEN_OPTS="-Duser.timezone=UTC -Xmx2268m -XX:MaxPermSize=1256m -Xss4m -Xss5024k"

export JAVA_HOME=$(/usr/libexec/java_home)


autoload -U zmv

# Needed for jsctags
# NODE_PATH='/usr/local/share/npm'
# NODE_PATH=/usr/local/lib/jsctags:$NODE_PATH
#

export TERM=xterm-256color

# TMUX
if which tmux 2>&1 >/dev/null; then
    # if no session is started, start a new session
    test -z ${TMUX} && tmux

    # when quitting tmux, try to attach
    while test -z ${TMUX}; do
        tmux attach || break
    done
fi
