define nginx::config (
    $upstream_name = $title,
    $content,
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
        content => $content,
        require => Package['nginx'],
    }

    Package['nginx'] ->
    File["$title-enabled"] ->
    File["$title-available"] ~>
    Service['nginx']
}
