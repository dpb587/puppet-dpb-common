class dpb-common::srv::vagrant {
    service {
        'iptables' :
            ensure => stopped,
            ;
    }

    package {
        [ 'ant', 'man', 'ntp', 'telnet', 'wget', 'vim-enhanced' ] :
            ensure => installed,
            ;
    }
}
