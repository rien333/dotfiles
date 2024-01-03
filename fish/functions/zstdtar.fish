function zstdtar
    argparse h/help -- $argv

    # If -h or --help is given, we print a little help text and return
    if set -q _flag_help
        echo -e "usage: zstdtar [directory]\n\n Decompress a directory when given a tar.zst file, and compress when given a normal directory. Remvove the original archive when unpacked"
        return 0
    end

    if string match -q "directory" (file -b $argv[1])
        env ZSTD_NBTHREADS=9 ZSTD_CLEVEL=5 tar --zstd -cf $argv[1].tar.zst $argv[1]
    else if string match -q -r '.*\.tar\.zst' $argv[1]
        env ZSTD_NBTHREADS=9 tar --zstd -xvf $argv[1]
        rm $argv[1]
    else
        echo "Invalid file, expected a directory or .tar.zst file."
        return 1
    end
end
