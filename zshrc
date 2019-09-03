# vim keybindings
bindkey -v

# Source Antigen (zsh plugin manager)
source "$HOME/.local/share/antigen.zsh"

# Set the default plugin repo to be zsh-utils
antigen use belak/zsh-utils

# Specify completions we want before the completion module
antigen bundle zsh-users/zsh-completions

# Specify plugins we want
antigen bundle editor
antigen bundle history
antigen bundle prompt
antigen bundle utility
antigen bundle completion

## Specify additional external plugins we want
# z - jump around through history
antigen bundle rupa/z
# Shell scripting syntax highlighting
antigen bundle zsh-users/zsh-syntax-highlighting
# Suggests commands as you type
antigen bundle zsh-users/zsh-autosuggestions
# CTRL+u suggests what to do next
antigen bundle oknowton/zsh-dwim
# Tab completion for z
antigen bundle changyuheng/fz
# CTRL+r multi word history search
antigen bundle zdharma/history-search-multi-word
# ESC ESC to add `sudo` in front of the current command
# does not work with tmux
antigen bundle hcgraf/zsh-sudo
# bd = jump back to directory
antigen bundle Tarrasch/zsh-bd
# Add aliases for docker commands (`up` for `docker-compose up`, …)
antigen bundle Cloudstek/zsh-plugin-appup
# Expand ... to ../.. and so forth
antigen bundle wazum/zsh-directory-dot-expansion

# Customize to your needs...
POWERLEVEL9K_MODE='nerdfont-complete'
antigen theme romkatv/powerlevel10k

# Load everything
antigen apply

# Share history among terminals
setopt inc_append_history
setopt share_history

# Auto cd into named directory
setopt auto_cd

# Auto correct typed commands
setopt correctall

# has problems with git status
alias git status='nocorrect git status'

# Re-map certain shortcuts
bindkey '^P' up-history
bindkey '^N' down-history
bindkey '^?' backward-delete-char
bindkey '^h' backward-delete-char
bindkey '^w' backward-kill-word
bindkey '^r' history-search-multi-word
# bind key for fz plugin above
bindkey '^I' __fz_zsh_completion

# no lag while pressing ESC
export KEYTIMEOUT=1

# Tell everybody that the terminal has more colors
export TERM=xterm-256color

export EDITOR=vim
export VISUAL=$EDITOR
export GOPATH=$HOME/go

export PATH=$PATH:~/.yarn/bin
export NODE_PATH=$NODE_PATH:/usr/lib/node_modules

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

source "$HOME/.zsh/tmuxinator.zsh"

# https://github.com/sorin-ionescu/prezto
# see .zpreztorc
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Set aliases
alias xit="exit"
alias vi="vim"

# Start tmux session
if [ -z "$TMUX" ]; then exec tmux; fi;

