class dpb-common::vagrant {
    include dpb-common
    include repo-epel::yum
    include repo-remi::yum

    package {
        [ 'ant', 'git', 'man', 'ntp', 'telnet', 'wget', 'vim-enhanced' ] :
            ensure => installed,
            ;
    }

    file {
        '/etc/profile.d/z-prompt.sh' :
            ensure => file,
            content => 'export PS1="\u@\h:\w $ "',
            owner => 'root',
            group => 'root',
            mode => 644,
            ;
    }

    service {
        'iptables' :
            ensure => stopped,
            ;
    }
}
