# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="kphoen"

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
# plugins=(mvn git git-extras zsh-syntax-highlighting history-substring-search mouse colorize osx common-aliases cp gitignore node rbenv brew autojump) 
# plugins=(git mvn zsh-syntax-highlighting history-substring-search mouse colorize vi-mode osx common-aliases cp gitignore node rbenv)
plugins=(zsh-syntax-highlighting mouse rbenv autojump)

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

source /opt/boxen/env.sh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

. $HOME/.bin/z/z.sh

# rbenv
eval "$(rbenv init -)"
# local bin
export PATH=/usr/local/bin:$PATH:~/.bin

# Splunk
export PATH=$PATH:/usr/local/bin/splunk/bin

# python pip module
# see http://nojhan.github.io/colout/ for examples on adding color to the terminal
export PATH=$PATH:/usr/local/share/python

export EDITOR='vim'

# sbt
export PATH=$PATH:/Users/tadsanden/code/sbt

# custom cdpaths
cdpath=($HOME/repos)

# boost the maven memory, useful for when running  jetty
export MAVEN_OPTS="-Duser.timezone=UTC -Xmx2268m -XX:MaxPermSize=1256m -Xss4m -Xss5024k"

export JAVA_HOME=$(/usr/libexec/java_home)

autoload -U zmv

export TERM=xterm-256color

# if [ "$TMUX" = "" ]; then tmux; fi

highlight () {
  perl -pe "s/$1/\e[1;31;43m$&\e[0m/g"
}
export DOCKER_HOST=tcp://localhost:4243

`brew --prefix`/etc/profile.d/z.sh
