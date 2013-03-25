define nginx::proxypass (
    $upstream_name = $title,
    $server_domain,
    $socket,
    $static_dir = false,
    $port = 80,
    ) {

    include nginx

    file { "$title-enabled":
        path => "/etc/nginx/sites-enabled/$upstream_name.conf",
        ensure => link,
        target => "/etc/nginx/sites-available/$upstream_name.conf",
        notify => Service['nginx'],
        require => Package['nginx'],
    }

    file { "$title-available":
        path => "/etc/nginx/sites-available/$upstream_name.conf",
        ensure => file,
        content => template("nginx/proxypass_template.erb"),
        require => Package['nginx'],
    }

    Package['nginx'] ->
    File["$title-enabled"] ->
    File["$title-available"] ~>
    Service['nginx']
}
