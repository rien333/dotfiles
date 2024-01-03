function fish_prompt
    set_color white --bold
    echo -n (basename (pwd | sed -e "s|^$HOME|~|"))" "
    set_color green
    echo -n "❯ "
    set_color normal
end
