define dpb-common::app-generic (
    $version,
    $owner,
    $group,
    $config,
) {
    file {
        "${name}" :
            ensure => directory,
            mode => 0711,
            owner => $owner,
            group => $group,
            ;
        "${name}/shared" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
        "${name}/shared/etc" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            require => File["${name}/shared"],
            ;
        "${name}/shared/etc/ant.properties" :
            ensure => file,
            content => "# auto-generated
install=${name}
version=${version}
owner=${user}
group=${group}",
            owner => $owner,
            group => $group,
            mode => 700,
            ;
        "${name}/shared/mnt" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            require => File["${name}/shared"],
            ;
        "${name}/shared/var" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            require => File["${name}/shared"],
            ;
        "${name}/releases" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
    }
}
