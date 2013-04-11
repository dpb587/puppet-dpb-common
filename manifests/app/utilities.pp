class dpb-common::app::utilities {
    file {
        '/usr/bin/app-deploy' :
            ensure => file,
            owner => 'root',
            group => 'root',
            mode => 555,
            source => 'puppet:///modules/dpb-common/app/app-deploy',
            ;
        '/usr/bin/app-deploy-dev' :
            ensure => file,
            owner => 'root',
            group => 'root',
            mode => 555,
            source => 'puppet:///modules/dpb-common/app/app-deploy-dev',
            ;
        '/usr/bin/app-vagrantize' :
            ensure => file,
            owner => 'root',
            group => 'root',
            mode => 555,
            source => 'puppet:///modules/dpb-common/app/app-vagrantize',
            ;
    }
}
