function sysupdate

    printf 'Updating...\n'
    sudo reflector --save /etc/pacman.d/mirrorlist
    yay -Syu
    sudo flatpak update

    printf 'Cleaning...\n'
    sudo paccache -rk1
    sudo paccache -ruk0
    sudo flatpak uninstall --unused

    printf 'Done!\n'

end
