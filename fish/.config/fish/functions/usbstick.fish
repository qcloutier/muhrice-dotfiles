function usbstick

    if test (count $argv) = 0
        printf "Options:\n  '-mf' mount fat \n  '-m' mount generic\n  '-u' unmount\n"
    else
        switch $argv[1]
            case '-mf'
                sudo mount -t vfat -o uid=1000,gid=1000 $argv[2] ~/Mount
            case '-m'
                sudo mount $argv[2] ~/Mount
            case '-u'
                sudo umount -f ~/Mount
         end
    end

end
