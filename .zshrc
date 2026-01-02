
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$HOME/.local/bin:$PATH"

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)


fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
fpath+=${ASDF_DATA_DIR:-$HOME/.asdf}/completions
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#
# SPECIAL LINUX VARIABLES
#

export EDITOR=nvim

#
# COMMANDS
#

# Edit open command line in $EDITOR
autoload -Uz edit-commamnd-line
zle -N edit-command-line
bindkey '^X^e' edit-command-line
