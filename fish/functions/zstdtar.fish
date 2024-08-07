function zstdtar
    argparse h/help -- $argv


    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        echo -e "usage: zstdtar [directory]\n\n Decompress a directory when given a tar.zst file, and compress when given a normal directory. Remove the original archive when unpacked"
        return 0
    end

    set fname (echo $argv[1] | sd '(.*)/$' '$1')

    if file -b $fname | grep -q "directory"
        set archive_name "$fname".tar.zst
        touch "$archive_name"
        env ZSTD_NBTHREADS=9 ZSTD_CLEVEL=5 tar --exclude "$archive_name" --zstd -cf "$archive_name" "$fname"
    else if string match -q -r '.*\.tar\.zst' $argv[1]
        env ZSTD_NBTHREADS=9 tar --zstd -xvf $argv[1]
        rm $argv[1]
    else
        echo "Invalid file, expected a directory or .tar.zst file."
        return 1
    end
end
