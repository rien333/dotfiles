function e
    if set -q INSIDE_EMACS
	    find_file $argv
    else
        emacs -nw $argv
    end
end
