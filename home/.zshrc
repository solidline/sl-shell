# Source oh-my-zsh if it is installed.
if [[ -d $HOME/.oh-my-zsh ]]; then
  # Path to your oh-my-zsh configuration.
  ZSH=$HOME/.oh-my-zsh

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # Example format: plugins=(rails git textmate ruby lighthouse)
  plugins=(git ruby rails autojump rbenv gem grails)

  export ZSH_THEME="simple"

  # Load default oh-my-zsh stuff
  source $ZSH/oh-my-zsh.sh
fi

# Don't change. The following determines where YADR is installed.
# yadr=`find -L ~ -type file -maxdepth 2 -name .yadr | head | sed 's:\.yadr\/::'`

# Configuration
source $HOME/.secrets
source $HOME/.zsh/aliases
source $HOME/.zsh/zsh_aliases
source $HOME/.zsh/prompt

# Things I don't want to publish to github
[[ -s "$HOME/.secrets" ]] && source "$HOME/.secrets"

# Vim mode
bindkey -v

# Give me my bash style incremental search
bindkey '^R' history-incremental-search-backward

# Speed up git completion
# http://talkings.org/post/5236392664/zsh-and-slow-git-completion
__git_files () {
  _wanted files expl 'local files' _files
}

# Always pushd when changing directory
setopt auto_pushd

# Fuzzy matching of completions for when you mistype them:
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric

# Add path to our custom bins
export PATH=/usr/local/bin:$PATH:$yadr/bin:$yadr/bin/yadr

export NODE_PATH=/usr/local/lib/jsctags/:$NODE_PATH

# rbenv
[[ -d "$HOME/.rbenv" ]] && export PATH="$HOME/.rbenv/bin:$HOME/.rbenv/shims:$PATH"

# Custom cdpaths
cdpath=($HOME/repos $HOME/repos/client_portal)

# Boost the maven memory, useful for when running  jetty
export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=256m"

# Little markdown helper
function mdown () {
    (echo '
        <head>
            <style>
                body {
                    font-family: Georgia;
                    font-size: 17px;
                    line-height: 24px;
                    color: #222;
                    text-rendering: optimizeLegibility;
                    width: 670px;
                    margin: 20px auto;
                    padding-bottom: 80px;
                }
                h1, h2, h3, h4, h5, h6 {
                    font-weight: normal;
                    margin-top: 48px;
                }
                h1 { font-size: 48px; }
                h2 {
                    font-size: 36px;
                    border-bottom: 6px solid #ddd;
                    padding: 0 0 6px 0;
                }
                h3 {
                    font-size: 24px;
                    border-bottom: 6px solid #eee;
                    padding: 0 0 2px 0;
                }
                h4 { font-size: 20px; }
                pre {
                    background-color: #f5f5f5;
                    font: normal 15px Menlo;
                    line-height: 24px;
                    padding: 8px 10px;
                    overflow-x: scroll;
                    background-color:#f8f8f8;border:1px solid #ccc;font-size:13px;line-height:19px;overflow:auto;padding:6px 10px;border-radius:3px;-moz-border-radius:3px;-webkit-border-radius:3px;
                }
            </style>
        </head>
    '; markdown $@) | bcat
}

source "`brew --prefix grc`/etc/grc.bashrc"
