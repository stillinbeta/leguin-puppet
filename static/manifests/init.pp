class static {
    require 'stillinbeta-user'
    include 'nginx'

    file { "/home/stillinbeta/static":
        ensure => directory,
        require => User['stillinbeta'],
    }

    file { "/etc/nginx/sites-available/static.conf":
        source => "puppet:///modules/static/nginx.conf",
        notify => Service['nginx'],
    }

    file {  "/etc/nginx/sites-enabled/static.conf":
        ensure => link,
        target => "/etc/nginx/sites-available/static.conf",
        notify => Service['nginx'],
    }
}

    
