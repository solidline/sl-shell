# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="garyblessington"

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
plugins=(git gem mvn bundler rbenv zsh-syntax-highlighting  history-substring-search)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

source $HOME/.zsh/aliases
source $HOME/.zsh/zsh_aliases

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"

# local bin
export PATH=/usr/local/bin:$PATH:~/.bin

# custom cdpaths
cdpath=($HOME/repos)

# boost the maven memory, useful for when running  jetty
export MAVEN_OPTS="-Duser.timezone=UTC -Xmx1512m -XX:MaxPermSize=1256m -Xss4m -Xss5024k"

# grab the weather
ww(){
 local zip=91350
 php -r '$xml = simplexml_load_file("http://api.wunderground.com/auto/wui/geo/ForecastXML/index.xml?query='${zip}'"); foreach($xml->txt_forecast->forecastday as $weather){ echo "{$weather->title}: "; echo $weather->fcttext; echo PHP_EOL . PHP_EOL;}' 
}

# variable to display which mode you are in.
VIMODE=">> "
function zle-keymap-select {
    VIMODE=“${${KEYMAP/(main|viins)/>> }/(vicmd)/}${${KEYMAP/vicmd/<< }/(main|viins)/}”
    zle reset-prompt
}
zle -N zle-keymap-select
set -o vi
