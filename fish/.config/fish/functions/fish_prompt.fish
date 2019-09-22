function fish_prompt

    set -g w (set_color -o white)
    set -g r (set_color -o red)
    set -g b (set_color -o blue)
    set -g g (set_color -o green)

    set t (date "+%H:%M:%S")
    set u $USER
    set h (prompt_hostname)
    set d $PWD

    printf '%s[%s%s%s|%s%s@%s%s|%s%s%s]\n>>> ' "$w" "$r" "$t" "$w" "$b" "$u" "$h" "$w" "$g" "$d" "$w"

end
