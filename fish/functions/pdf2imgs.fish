function pdf2imgs
    # exit if images/ already exists
    mkdir images || return -1
    
    for pdf in (fd -epdf)
        # creates a file img-%03d.jpg|png|tiff
        pdfimages -all "$pdf" images/im
        # find all images in pdfimages output
        set images (fd 'im' images/)
        for im in $images
            set img_ext (path extension "$im")
            set img_num (echo $im | sd 'images/im-(.*)\..*' '$1')
            mv $im (path dirname "$pdf")/(basename "$pdf" .pdf)-$img_num"$img_ext"
        end
    end
    
    rm -rf images/
end
