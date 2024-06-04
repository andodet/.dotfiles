export HSA_OVERRIDE_GFX_VERSION=10.3.0
#export PYENV_VIRTUALENV_DISABLE_PROMPT=0

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export GOPATH="$HOME/code/go"
export PATH="$GOPATH/bin:$PATH"

export PATH=$PATH:~/.local/bin
export RSTUDIO_CHROMIUM_ARGUMENTS="--disable-gpu"
export PATH="$PATH:~/opt"
export PATH="/opt:$PATH"
export PATH="$PATH:/home/anddt/.local/share/coursier/bin"

export FZF_DEFAULT_COMMAND='rg --hidden -l ""'
export FZF_CTRL_T_COMMAND='rg --hidden -l ""'
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#838383'

export ZSH_TMUX_AUTOSTART=true
export ZSH_TMUX_AUTOCONNECT=false
export VISUAL=vim
export EDITOR=vim

source ~/.zshenv_pvt

# Fix GKE auth lag
export USE_GKE_GCLOUD_AUTH_PLUGIN=True

. "$HOME/.cargo/env"
