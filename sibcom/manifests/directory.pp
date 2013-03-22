class sibcom::directory {
    require stillinbeta-user

    realize File["/home/stillinbeta/sites"]

    file { $sibcom::site_dir:
        ensure => directory,
        owner => 'stillinbeta',
    }
}
