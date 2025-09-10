# Homebrew environment
eval "$(/opt/homebrew/bin/brew shellenv)"

# Ruby (rbenv)
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init - zsh)"

# Terminal colors
export TERM="xterm-256color"
export COLORTERM=truecolor

# Python (pyenv + virtualenv)
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# direnv
eval "$(direnv hook zsh)"

# Node (nvm)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ]       && \. "$NVM_DIR/nvm.sh"        # this loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # and its completions

# Enable 'code' from Terminal
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"

