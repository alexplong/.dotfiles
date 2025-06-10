source ~/.config/fish/kitty.fish


if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Neovim Switcher
alias nvim-lazy='env NVIM_APPNAME=LazyVim nvim'
alias nvim-astro='env NVIM_APPNAME=AstroNvim nvim'
alias nvim-chad='env NVIM_APPNAME=NvChad nvim'
alias nvim-kick='env NVIM_APPNAME=kickstart nvim'

function nvims
    set items default LazyVim AstroNvim NvChad kickstart
    set config (printf "%s\n" $items | fzf --prompt=" Neovim Config = " --height=50% --layout=reverse --border --exit-0)
    if test -z "$config"
        echo "Nothing selected"
        return 0
    end
    if test "$config" = default
        set config ""
    end
    env NVIM_APPNAME=$config nvim $argv
end

# If you need to have sqlite first in your PATH, run:
# echo 'export PATH="/usr/local/opt/sqlite/bin:$PATH"' >> ~/.zshrc

# For compilers to find sqlite you may need to set:
# export LDFLAGS="-L/usr/local/opt/sqlite/lib"
# export CPPFLAGS="-I/usr/local/opt/sqlite/include"

# For compilers to find zlib you may need to set:
# export LDFLAGS="-L/usr/local/opt/zlib/lib"
# export CPPFLAGS="-I/usr/local/opt/zlib/include"

alias brew="env PATH=(string replace (pyenv root)/shims '' \"\$PATH\") brew"

set -Ux PYENV_ROOT $HOME/.pyenv
set -U fish_user_paths $PYENV_ROOT/bin $fish_user_paths

pyenv init - | source

# asdf - Fish & Homebrew configuration
#echo -e "\nsource "(brew --prefix asdf)"/libexec/asdf.fish" >>~/.config/fish/config.fish
#source /usr/local/opt/asdf/libexec/asdf.fish

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims


# Set the NVM directory
#set -gx NVM_DIR "$HOME/.nvm"

# Use `bass` to source the Bash NVM script
#if test -f "$NVM_DIR/nvm.sh"
#    bass source "$NVM_DIR/nvm.sh"
#end

# Use `bass` to source NVM bash completion
#if test -f "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
#    bass source "/usr/local/opt/nvm/etc/bash_completion.d/nvm"
#end

# The next line updates PATH for the Google Cloud SDK.
if test -f '/Users/alexplong/google-cloud-sdk/path.fish.inc'
    source '/Users/alexplong/google-cloud-sdk/path.fish.inc'
end

# The next line enables shell command completion for gcloud.
if test -f '/Users/alexplong/google-cloud-sdk/completion.fish.inc'
    source '/Users/alexplong/google-cloud-sdk/completion.fish.inc'
end

# Added by `rbenv init` on Fri Nov  1 14:45:12 EDT 2024
status --is-interactive; and rbenv init - --no-rehash fish | source

export PATH="$HOME/.emacs.d/bin:$PATH"

starship init fish | source
