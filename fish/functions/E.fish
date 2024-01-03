function E
    if set -q INSIDE_EMACS
        set -q argv[1]; or set argv[1] "."
        vterm_cmd find-file /sudo:root@localhost:(realpath "$argv")
    else
        sudo emacs -nw $argv
    end
end
