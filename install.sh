#!/usr/bin/bash

set -e



git clone https://aur.archlinux.org/gnome-browser-connector.git
cd gnome-browser-connector
makepkg -si

## Extensions to install
## Pop Shell
## Simply Workspaces
## Alt+Tab Scroll Workaround


## set shortcuts to switch between workspaces
for i in {1..10}
do
  dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-$i "['<Super>$i']"

  dconf write /org/gnome/shell/keybindings/switch-to-application-$i "@as []"
done

dconf write /org/gnome/desktop/wm/keybindings/switch-to-workspace-10 "['<Super>0']"

for i in {1..10}
do
  dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-$i "['<Super><Shift>$i']"
done

dconf write /org/gnome/desktop/wm/keybindings/move-to-workspace-10 "['<Super><Shift>0']"
