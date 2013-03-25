define nginx::static (
    $site_name = $title,
    $domain,
    $directory,
    $port = 80,
    ) {

    include stillinbeta-user

    if $working_path =~ /^\/home\/stillinbeta\/sites/ {
        realize File["/home/stillinbeta/sites"]
    }

    file { "${directory}":
        ensure => directory,
        owner => 'stillinbeta',
    }

    nginx::config { "$site_name":
        content => template("nginx/static_template.erb"),
    }
}
