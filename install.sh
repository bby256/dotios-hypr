#!/usr/bin/env bash

echo ">Starting installation... Press CTRL+c to cancel."
sleep 5

echo ">Installing needed packages (using yay)..."

if ! command -v yay &>/dev/null; then
  echo "!!yay not found! Quitting..."
  exit 1
fi

yay -S --needed waybar pavucontrol hyprshot hyprshot-gui kitty thunar rofi-wayland hyprland imagemagick ttf-arimo-nerd mpv swaync arc-gtk-theme arc-icon-theme gtk3 nwg-look polkit-gnome swww nwg-displays emote

dir="$HOME/dotios-hypr"
conf="$HOME/.config"

echo ">Backing up current config..."
mkdir -p $HOME/rice-backup
cp -r $conf/hypr $HOME/rice-backup/
cp -r $conf/gtk-3.0 $HOME/rice-backup/
cp -r $conf/kitty $HOME/rice-backup/
cp -r $conf/rofi $HOME/rice-backup/
cp -r $conf/swaync $HOME/rice-backup/
cp -r $conf/waybar $HOME/rice-backup/

echo ">Removing old configs..."
rm -rf $conf/gtk-3.0 $conf/hypr/* $conf/kitty $conf/rofi $conf/swaync $conf/waybar

echo ">Copying new files..."
cp $dir/dots/hypr/* $conf/hypr/
cp -r $dir/dots/gtk-3.0 $conf/
cp -r $dir/dots/kitty $conf/
cp -r $dir/dots/rofi $conf/
cp -r $dir/dots/swaync $conf/
cp -r $dir/dots/waybar $conf/

echo ">Installation complete!"
echo ">Quitting hyprland in 10 seconds so changes properly take effect (CTRL+c to cancel)..."
sleep 10
hyprctl dispatch exit