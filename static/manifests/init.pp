class static {
    include 'nginx'

    file { "/home/stillinbeta/nginx":
        ensure => directory,
    }

    file { "/etc/nginx/sites-available/static.conf":
        source => "puppet:///modules/static/nginx.conf",
    }

    file {  "/etc/nginx/sites-enabled/static.conf":
        ensure => link,
        target =>  "/etc/nginx/sites-available/static.conf",
        notify => Service['nginx'],
    }
}

    
