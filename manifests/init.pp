class dpb-common {
    stage {
        'pre-main' :
            before => Stage['main'],
            ;
        'post-main' :
            require => Stage['main'],
            ;
    }
}
