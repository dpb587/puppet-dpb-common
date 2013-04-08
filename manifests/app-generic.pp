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
        "${name}/private" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
        "${name}/private/app.yaml" :
            ensure => file,
            content => inline_template('<%= { "install" => @name, "version" => @version, "owner" => @owner, "group" => @group, "config" => @config }.to_yaml %>'),
            owner => $owner,
            group => $group,
            mode => 700,
            require => File["${name}/private"],
            ;
        "${name}/shared" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
        "${name}/shared/app.properties" :
            ensure => file,
            content => "# auto-generated
install=${name}
version=${version}
owner=${user}
group=${group}",
            owner => $owner,
            group => $group,
            mode => 700,
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
