class dpb-common::srv::vagrant {
    package {
        [ 'ant', 'man', 'ntp', 'telnet', 'wget', 'vim-enhanced' ] :
            ensure => installed,
            ;
    }
}
