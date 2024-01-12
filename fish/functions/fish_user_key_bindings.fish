function fish_user_key_bindings
    bind \eL 'echo; lsh  --color=always --indicator-style=slash |  sed "s/^/ /" ; commandline -f force-repaint'
    bind \eh 'echo; lsh  --color=always --indicator-style=slash |  sed "s/^/ /" ; commandline -f force-repaint'
    bind \ev 'true'
    bind \ep 'echo; pwd ; commandline -f force-repaint'
    bind \e\" __fish_commandline_insert_escaped\ \'\"\"\'\;\ commandline\ -f\ backward-char
    bind \e\' __fish_commandline_insert_escaped\ \"\'\'\"\;\ commandline\ -f\ backward-char
    bind \e\( __fish_commandline_insert_escaped\ \\\(\\\)\;\ commandline\ -f\ backward-char\ force-repaint
end
