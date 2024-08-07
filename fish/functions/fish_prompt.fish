function fish_prompt
    set_color blue --bold
    echo -n (basename (pwd | sed "s|^/home/rw|~|"))
    set_color red
    echo -n "> "
    set_color normal
end
