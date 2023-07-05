#!/bin/bash

# force various apps in to more XDG compliant type behaviour
if ! test -f /etc/profile.d/xdg.sh; then
    echo "creating /etc/profile.d/xdg.sh"
    sudo tee /etc/profile.d/xdg.sh >/dev/null <<EOF
#!/bin/sh
export XDG_CONFIG_HOME="\${HOME}/.config"
export XDG_CACHE_HOME="\${HOME}/.cache"
export XDG_DATA_HOME="\${HOME}/.local/share"
export XDG_STATE_HOME="\${HOME}/.local/state"

# config
export BASH_COMPLETION_USER_FILE="\${XDG_CONFIG_HOME}/bash-completion/bash_completion"
export FFMPEG_DATADIR="\${XDG_CONFIG_HOME}/ffmpeg"
export BUNDLE_USER_CONFIG="\${XDG_CONFIG_HOME}/bundle"

# cache
export MYPY_CACHE_DIR="\${XDG_CACHE_HOME}/mypy"
export NODE_REPL_HISTORY="\${XDG_CACHE_HOME}/node_hst"
export LESSHISTFILE="\${XDG_CACHE_HOME}/lesshist"
export HISTFILE="\${XDG_CACHE_HOME}/hist"
export BUNDLE_USER_CACHE="\${XDG_CACHE_HOME}/bundle"
export DENO_DIR="\${XDG_CACHE_HOME}/deno"

# data
export CARGO_HOME="\${XDG_DATA_HOME}/cargo"
export GOPATH="\${XDG_DATA_HOME}/go"
export RUSTUP_HOME="\${XDG_DATA_HOME}/rustup"
export DENO_INSTALL_ROOT="\${XDG_DATA_HOME}/deno"
export BUNDLE_USER_PLUGIN="\${XDG_DATA_HOME}/bundle"
export RBENV_ROOT="\${XDG_DATA_HOME}/rbenv"
EOF
    source /etc/profile.d/xdg.sh
fi

# allows using ~/.config/bash/bashrc rather than ~/.bashrc
XDG_BASHRC="xdg_bashrc=\"\${HOME}/.config/bash/bashrc\"; if test -f \"\$xdg_bashrc\"; then source \"\$xdg_bashrc\"; fi"
if ! (cat /etc/bash.bashrc | grep "xdg_bashrc=" >/dev/null); then
    echo "appending xdg_bashrc=... to /etc/bash.bashrc"
    echo $XDG_BASHRC | sudo tee -a /etc/bash.bashrc >/dev/null
fi
