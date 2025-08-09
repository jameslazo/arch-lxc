#!/bin/bash

# initialize
# pacman-key --init
# pacman-key --populate
# pacman -Syu git
# mkdir .config && cd .config
# git clone https://github.com/jameslazo/arch-lxc .
# chmod +x setup.sh && ./setup.sh

. ~/.config/bash/.bashrc
pacman -S --noconfirm tmux vim man-pages bash-completion cronie
systemctl enable cronie --now
mkdir ~/sh
echo -e "#!/bin/bash\npacman -Syu --noconfirm\nshutdown -r now" > ~/sh/upboot.sh
chmod +x ~/sh/upboot.sh
echo "01 0 * * sun /root/sh/upboot.sh" >> /etc/crontab


