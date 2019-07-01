function fish_prompt --description 'Write out the prompt'
    
    set -g w (set_color -o white)
    set -g r (set_color -o red)
    set -g b (set_color -o blue)
    set -g g (set_color -o green)
    set -g y (set_color -o yellow)

    set t (date "+%H:%M:%S")  
    set u $USER
    set h (prompt_hostname)
    set d $PWD
    set s $status

    printf '%s[%s%s%s|%s%s@%s%s|%s%s%s|%s%s%s]\n>>> ' "$w" "$r" "$t" "$w" "$b" "$u" "$h" "$w" "$g" "$d" "$w" "$y" "$s" "$w"

end
