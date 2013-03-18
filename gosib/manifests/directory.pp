class gosib::directory {
    require stillinbeta-user

    realize File["/home/stillinbeta/sites"]

    file { $gosib::site_dir:
        ensure => directory,
        owner => 'stillinbeta',
    }
}
