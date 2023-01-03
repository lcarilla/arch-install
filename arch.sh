#fdisk -l to list the disks
#fdisk /your/disk to select the disk
#partition the disk as you want
#no need to choose type for file system partition
#w to wrtie changes
#mkfs.fat -F32 /your/disk-EFI partition
#mkfs.ext4 /your/disk-FS-partition
#mount file system partition at /mnt
mkdir /mnt/home
mkdir /mnt/etc
genfstab -U -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
pacman -Sy archlinux-keyring
pacstrap -i /mnt base
arch-chroot /mnt
pacman -S linux linux-headers linux-lts linux-lts-headers
pacman -S nano
pacman -S base-devel
pacman -S networkmanager linux-firmware wpa_supplicant wireless_tools netctl
systemctl enable NetworkManager
cat  /etc/mkinitcpio.conf
mkinitcpio -p linux
mkinitcpio -p linux-lts
nano /etc/locale.gen
locale-gen
passwd
useradd -m -g users -G wheel harald
passwd harald
pacman -S sudo
which sudo
EDITOR=nano visudo
#uncomment first %wheel line
pacman -S grub efibootmgr dosfstools os-prober mtools
mkdir /boot/EFI
#mount /first/partition /boot/EFI
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck
ls -l /boot/grub
#if dir locale doesnt exist mkdir locale
cp /usr/share/locale/en\@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
grub-mkconfig -o /boot/grub/grub.cfg
#exit and press enter
umount -a 
# AFTER REBOOT
#timedatectl list
timedatectl set-timezone Your/Timezone
systemctl enable systemd-timesyncd
hostnamectl set-hostname arch
nano /etc/hosts
#127.0.0.1 localhost
#127.0.1.1 arch
pacman -S intel-ucode
pacman -S xorg-server
pacman -S mesa
pacman -S gnome
systemctl enable gdm 
#reboot
pacman -S discord chromium code
#install yay
pacman -Rns epiphany gnome-software gnome-photos gnome-music gnome-contacts gnome-text-editor cheese gnome-user-docs
pacman -Rns yelp gnome-video-effects gnome-calendar
yay -S noto-fonts
