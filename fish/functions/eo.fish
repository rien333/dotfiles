function eo
    set -q argv[1]; or set argv[1] "."
    vterm_cmd find-file-other-window (realpath "$argv")
end
