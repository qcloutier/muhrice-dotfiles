function fish_right_prompt

    switch $fish_bind_mode
        case default
            set_color --bold --background red white
            echo '[N]'
        case insert
            set_color --bold --background green white
            echo '[I]'
        case visual
            set_color --bold --background blue white
            echo '[V]'
    end

    set_color normal
    echo -n ''

end
