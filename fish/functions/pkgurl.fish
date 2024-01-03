function pkgurl
    set url (kittypack -f https://archlinux.org/packages/%r/%a/%n $argv)
    if not string length $url > /dev/null
        set url (yay -Si $argv[-1] | sed 's/^AUR URL.*\(http.*$\)/\1/;t;d')
    end
    if not string length $url > /dev/null
        return
    end
    open "$url"
end
