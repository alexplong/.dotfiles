# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git docker colorize)
source $ZSH/oh-my-zsh.sh

# PATH
export PATH="$HOME/.local/bin:$PATH"

# Neovim “switcher” aliases
alias nvim-lazy="NVIM_APPNAME=LazyVim nvim"
alias nvim-astro="NVIM_APPNAME=AstroNvim nvim"
alias nvim-chad="NVIM_APPNAME=NvChad nvim"
alias nvim-kick="NVIM_APPNAME=kickstart nvim"

# fzf picker to choose a config
function nvims() {
  local items=("default" "LazyVim" "AstroNvim" "NvChad" "kickstart")
  local config
  config=$(printf "%s\n" "${items[@]}" \
             | fzf --prompt=" Neovim Config  " \
                   --height=50% --layout=reverse --border --exit-0)
  [[ -z $config || $config == default ]] && config=""
  NVIM_APPNAME=$config nvim "$@"
}

# You can add any other interactive‐only aliases/functions here…


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/alexplong_mbp/.lmstudio/bin"
# End of LM Studio CLI section

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


# Task Master aliases added on 7/16/2025
alias tm='task-master'
alias taskmaster='task-master'

