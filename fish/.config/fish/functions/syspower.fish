function syspower

    if test (count $argv) = 0
        printf "Options:\n  '-s' to suspend\n  '-h' to hibernate\n  '-r' to reboot\n  '-p' to poweroff\n"
    else
        sleep 3s

        switch $argv[1]
            case '-s'
                sudo systemctl suspend
            case '-h'
                sudo systemctl hibernate
            case '-r'
                sudo systemctl reboot
            case '-p'
                sudo systemctl poweroff
         end
    end

end
