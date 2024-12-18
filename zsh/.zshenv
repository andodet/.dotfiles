export PYENV_VIRTUALENV_DISABLE_PROMPT=0

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

export PATH=$PATH:~/.local/bin
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"
export PATH="$PATH:/opt"
export PATH="/opt:$PATH"
export PATH="/opt/nvim-linux64/bin:$PATH"
export PATH="$PATH:/home/anddt/.local/share/coursier/bin"
export PATH="PATH=$HOME/.local/bin/godot:$PATH"

export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git --exclude node_modules'
export FZF_DEFAULT_COMMAND='rg -l --exclude .git --exclude node_modules ""'
export FZF_CTRL_T_COMMAND='rg --hidden -l ""'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#838383'

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export VISUAL=vim
export EDITOR=vim

source ~/.zshenv_pvt

# Fix GKE auth lag
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

#. "$HOME/.cargo/env"
