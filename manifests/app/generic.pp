define dpb-common::app::generic (
    $install,
    $version,
    $owner,
    $group,
    $config,
    $deploy_uri = "",
    $deploy_ref = "master",
) {
    file {
        "${install}" :
            ensure => directory,
            mode => 0711,
            owner => $owner,
            group => $group,
            ;
        "${install}/private" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
        "${install}/private/app.yaml" :
            ensure => file,
            content => inline_template('<%= { "name" => @name, "install" => @install, "version" => @version, "owner" => @owner, "group" => @group, "deploy_uri" => @deploy_uri, "deploy_ref" => @deploy_ref, "config" => @config }.to_yaml %>'),
            owner => $owner,
            group => $group,
            mode => 700,
            require => [
                File["${install}/private"],
            ],
            ;
        "${install}/shared" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
        "${install}/shared/app.properties" :
            ensure => file,
            content => "# auto-generated
name=${name}
install=${install}
environment=${::environment}
version=${version}
owner=${user}
group=${group}
deploy_uri=${deploy_uri}
deploy_ref=${deploy_ref}",
            owner => $owner,
            group => $group,
            mode => 700,
            require => [
                File["${install}/shared"],
            ],
            ;
        "${install}/releases" :
            ensure => directory,
            mode => 0700,
            owner => $owner,
            group => $group,
            ;
    }
}
