class static {
    include 'nginx'

    file { "/home/stillinbeta/static":
        ensure => directory,
    }

    file { "/etc/nginx/sites-available/static.conf":
        source => "puppet:///modules/static/nginx.conf",
        notify => Service['nginx'],
    }

    file {  "/etc/nginx/sites-enabled/static.conf":
        ensure => link,
        target =>  "/etc/nginx/sites-available/static.conf",
        notify => Service['nginx'],
    }
}

    
