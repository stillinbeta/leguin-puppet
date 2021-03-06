class nginx {
    package { 'nginx':
        ensure => installed,
    }

    file { "/etc/init/nginx.conf":
        ensure => file,
        source => "puppet:///modules/nginx/nginx.conf"
    }

    file { "/etc/nginx/error":
        ensure => directory,
        source => "puppet:///modules/nginx/error",
        recurse => true,
        require => Package['nginx'],
    }


    service { nginx:
        ensure => running,
        provider => upstart,
        require => [
            File["/etc/init/nginx.conf"],
            Package["nginx"],
        ]
    }

    user { "www-data":
        ensure => present,
    }

    file { "/etc/nginx/ssl":
        ensure => directory,
        owner => "www-data",
        group => "www-data",
        mode => "u=rw",
    }

    file { "/etc/nginx/conf.d/ssl.conf":
        ensure  => file,
        source  => "puppet:///modules/nginx/ssl.conf",
        require => Package['nginx'],
        notify  => Service['nginx'],
    }

}
