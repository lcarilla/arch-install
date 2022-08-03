#!/usr/bin/sh
pacman -S linux-firmware
pacman -S chromium
pacman -S code-oss
pacman -S discord
pacman -S pulseaudio
pacman -S pavucontrol
pacman -S nm-connection-editor
pacman -S vscode
pacman -S libreoffice
pacman -S gparted
mkdir /media
cd /media
mkdir usb
pacman -S ntfs-3g
pacman -S git
#exec as normal user
git clone https://aur.archlinux.org/tor-browser
cd tor-browser/
makepkg -si
#evtl pgp key requesten
pacman -S papirus-icon-theme
#android studio tar.gz herunterladen 
tar xvzf PACKAGENAME.tar.gz
#android-studio/setup.sh
pacman -S zip 
pacman -S xz
pacman -S unzip
#download flutter tar.xz
tar xvzf PACKAGENAME.tar.xz
pacman -S clang
pacman -S cmake
https://stackoverflow.com/questions/68236007/i-am-getting-error-cmdline-tools-component-is-missing-after-installing-flutter
pacman -S python-pip
pacman -R xfwm4-themes
systemctl restart NetworkManager   #just in case
systemctl disable systemd-journald
pacman -S system-config-printer
pacman -S cups
usermod -aG lp harald
systemctl enable --now cups
pacman -S hplip

