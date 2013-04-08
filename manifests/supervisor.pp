class dpb-common::supervisor {
    exec {
        '/usr/bin/easy_install' :
            command => '/usr/bin/wget http://pypi.python.org/packages/2.6/s/setuptools/setuptools-0.6c11-py2.6.egg && /bin/sh setuptools-0.6c11-py2.6.egg && /bin/rm setuptools-0.6c11-py2.6.egg',
            creates => '/usr/bin/easy_install',
            cwd => '/tmp/',
            ;
        '/usr/bin/supervisord' :
            command => '/usr/bin/easy_install supervisor',
            creates => '/usr/bin/supervisord',
            require => [
                Exec['/usr/bin/easy_install'],
            ],
            ;
    }

    file {
        '/etc/init.d/supervisord' :
            source => 'puppet:///modules/dpb-common/initd-supervisord',
            owner => 'root',
            group => 'root',
            mode => 0755,
            ;
    }

    package {
        'supervisor' :
            noop => true,
            ;
    }

    include supervisor
}
