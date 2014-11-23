define nginx::static (
    $site_name = $title,
    $domain,
    $directory,
    $port = 80,
    $ipv6 = true,
    $ssl_port = 443,
    $ssl = false,
    $default_server = false,
    ) {

    include stillinbeta-user

    if $working_path =~ /^\/home\/stillinbeta\/sites/ {
        realize File["/home/stillinbeta/sites"]
    }

    
    unless defined(File[$directory]) {
        file { "${directory}":
            ensure => directory,
            owner => 'stillinbeta',
        }
    }

    nginx::config { "$site_name":
        content => template("nginx/static_template.erb"),
    }
}
