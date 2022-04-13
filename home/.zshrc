# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

export PATH="$PATH:$HOME/.homesick/repos/sl-shell/base16-shell/scripts/"

# 
# From brew install: 
# Add the following to your zshrc to access the online help:

autoload -U compinit && compinit

fpath=( "/usr/local/share/zsh/site-functions" $fpath )

autoload -U promptinit && promptinit

prompt off

# custom bin
export PATH="$HOME/.bin:$PATH"

# export PATH="/usr/local/opt/openjdk@11/bin:$PATH"
alias cat='bat --theme=base16'

export PATH="/Users/tsanden/homebrew/bin:$PATH"
export PATH="/Users/tsanden/homebrew/lib/ruby/gems/3.0.0/bin:$PATH"
export PATH="/Users/tsanden/homebrew/opt/ruby/bin:$PATH"

export PATH="$HOME/.rover/bin:$PATH"
export PATH="$HOME/bin/homebrew/bin:$PATH"

export GOPATH=$HOME/go

# set neovim to default to .config
export XDG_CONFIG_HOME=~/.config

export FZF_DEFAULT_OPTS=--color=16

# FZF Options
export FZF_DEFAULT_OPTS='-m --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
export POWERLINE_CONFIG_COMMAND=/Users/tsanden/Library/Python/3.7/bin/powerline-config

source $HOME/.zsh/aliases 2>&1 /dev/null
source $HOME/.zsh/zsh_aliases
source $HOME/.zprivate
source $HOME/.sdkman/bin/sdkman-init.sh

export EDITOR="nvim"
export VISUAL="nvim"

# [ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

alias prettyjson='python -m json.tool'

alias v=nvim

okta-int() {
  printf '2\n1\n' | okta-awscli -f --profile default
}

# place this after nvm initialization!
autoload -U add-zsh-hook

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize
