#!/bin/bash
set -euo pipefail

# basic utilities
sudo pacman -Sy --needed --noconfirm --noprogressbar \
    bash-completion \
    openssh \
    man-db \
    ripgrep \
    neovim \
    fzf \
    fd

# graphics
sudo pacman -Sy --needed --noconfirm --noprogressbar \
    vulkan-intel \
    intel-media-driver

# sway + de
sudo pacman -Sy --needed --noconfirm --noprogressbar \
    sway \
    swayidle \
    swaylock \
    swaybg \
    fish \
    foot \
    foot-terminfo \
    xdg-desktop-portal \
    xdg-desktop-portal-wlr \
    pipewire-jack \
    pipewire-pulse \
    pavucontrol \
    wl-clipboard \
    waybar \
    wofi \
    brightnessctl \
    xdg-user-dirs

# fonts
sudo pacman -Sy --needed --noconfirm --noprogressbar \
    noto-fonts \
    noto-fonts-cjk \
    noto-fonts-emoji \
    ttf-liberation \
    ttf-iosevka-nerd \
    ttf-nerd-fonts-symbols-mono
