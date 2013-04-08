class dpb-common::app-vagrant {
    file {
        '/home/vagrant/default/releases/dev' :
            ensure => link,
            target => '/vagrant/home',
            require => File['/home/vagrant/default/releases'],
            ;
        '/home/vagrant/default/releases/dev/mnt' :
            ensure => link,
            target => '/home/vagrant/default/shared',
            require => File['/home/vagrant/default/releases/dev'],
            ;
        '/home/vagrant/default/current' :
            ensure => link,
            target => '/home/vagrant/default/releases/dev',
            require => File['/home/vagrant/default'],
            ;
    }
}
