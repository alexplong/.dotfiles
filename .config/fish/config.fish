source ~/.config/fish/kitty.fish


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Neovim Related
set -x NVM_DIR "$HOME/.nvm"
test -s "$NVM_DIR/nvm.sh"; and source "$NVM_DIR/nvm.sh"  # This loads nvm
test -s "$NVM_DIR/bash_completion"; and source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Neovim Switcher
alias nvim-lazy='env NVIM_APPNAME=LazyVim nvim'
alias nvim-astro='env NVIM_APPNAME=AstroNvim nvim'
alias nvim-chad='env NVIM_APPNAME=NvChad nvim'
alias nvim-kick='env NVIM_APPNAME=kickstart nvim'

function nvims
    set items "default" "LazyVim" "AstroNvim" "NvChad" "kickstart"
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config  " --height=50% --layout=reverse --border --exit-0)
    if test -z "$config"
        echo "Nothing selected"
        return 0
    end
    if test "$config" = "default"
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

starship init fish | source
