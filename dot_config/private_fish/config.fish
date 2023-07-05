set -g fish_greeting

set -ga PATH /home/terry/.local/cargo/bin
set -ga PATH /home/terry/.local/bin
set -x GTK_THEME Arc-solid
set -x EDITOR /usr/bin/nvim

set -x OMNI_GIT "$HOME/repos"
set -x OMNIDIR "$OMNI_GIT/omni"
set -x OMNI_ORG "git@github.com:XaF,github.com/XaF"

if status is-interactive
    alias ls="ls --color=auto"
    alias pacman="sudo pacman"
    alias podman="sudo podman"
    alias ip="ip -c=always"

    omni hook init fish | source
end
