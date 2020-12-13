check your internet connectiong

ping google.com

// wifi-menu if you need wireless (not recommended)

// pacman -S reflector // pretty sure this is broken in latest

// find dual boot EFI part
`fdisk -l`


Partition drives

ext2 for boot

mkfs.ext4 /dev/rootpart //ex /dev/nvme0n1p7 or /dev/sdb1


//mount
mount /dev/<ROOTPART> //ex /dev/nvme0n1p7 or /dev/sdb1
swapon /dev/<SWAPPART>
mount /dev/<EFIPART> //ex. /dev/sda2 /dev/nvme0n1p1

pacstrap /mnt base base-devel linux linux-firmware linux-headers net-tools neovim sudo fish amd-ucode
(intel-ucode)

// WARN: this will overwrite your fstab file, recommended to make a copy.
genfstab -U /mnt > /mnt/etc/fstab

arch-chroot /mnt

set timezone (symlink your tz)
ln -sf /usr/share/zoneinfo/America/Chicago
hwclock --systohc
timedatectl set-ntp true

// Note: if you dont know your locale you can modify your locale.gen and uncomment the appropriate line
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen[root@archiso /]# locale-gen

[root@archiso /]# echo "LANG=en_US.UTF-8" >> /etc/locale.conf
[root@archiso /]# hostnamectl set-hostname <$HOSTNAME>
[root@archiso /]# echo "<$HOSTNAME>" >> /etc/hostname
[root@archiso /]# echo "127.0.1.1 <$HOSTNAME>" >> /etc/hostname //not sure if/why you would do this?

// Dont forget to set ROOT PASSWORD
[root@archiso /]# passwd

//BOOTLOADER
`pacman -S refind networkmanager
(? os-prober mtools? dosfstools? dialog?)
lablk | grep EFI
refind-install --userdefault /dev/nvme0n1p2 --alldrivers (point to windows EFI patition)
mkrlconf

---example refind_linux.conf---(can just rm?)
/mnt/boot/refind_linux.conf

"Boot with minimal options" " root=/dev/nvme0n1p7"//some uid

Modify the 
--example /boot/EFI/Boot/refind.conf---
>> change in line for Archlinux pp

// you will want networking when you reboot :smile:
systemctl enable NetworkManager

useradd -m -G wheel <$USERNAME>
passwd <$primaryUser>

//user creation, give yourself sudoers
sudo EDITOR=vim visudo

--example /etc/sudoers
//uncomment %wheel line

desktop enviornment

xorg-server
make sure to install as root
nvidia nvidia-utils nvidia-settings

nvidia-xconfig
lightd(qt5-tools) qt breeze
 


systemctl enable sddm.service
//bspwm sxhkd 
awesome
alacritty git picom polybar

install yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

steam gaming
edit pacman.conf

pacman -S openssh

## QT apps

NOTE: set your QT_QPA_PLATFORMTHEME=

sudo pacman -S qt5ct dolphin 

_map windows (super) key to rofi_
yay -S ksuperkey
// super + d must be set to rofi somewhere else
ksuperkey -e 'Super_L=Super_L|d'
