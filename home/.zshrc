export PATH="$PATH:$HOME/.homesick/repos/sl-shell/base16-shell/scripts/"
export PATH="$HOME/.rover/bin:$PATH"
export PATH="$HOME/homebrew/bin:$PATH"
export PATH="/Users/tsanden/homebrew/opt/m4/bin:$PATH"

export XDG_CONFIG_HOME=~/.config # set neovim to default to .config
export FZF_DEFAULT_OPTS='-m --color=16 --bind ctrl-a:select-all,ctrl-d:deselect-all,ctrl-t:toggle-all'
export POWERLINE_CONFIG_COMMAND=$HOME/Library/Python/3.7/bin/powerline-config

source $HOME/.zsh/aliases 2>&1 /dev/null
source $HOME/.zsh/zsh_aliases
source $HOME/.zprivate

export EDITOR="nvim"
export VISUAL="nvim"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
(( ! ${+functions[p10k]} )) || p10k finalize

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

prompt off
