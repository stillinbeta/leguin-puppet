class gosib::directory {
    require stillinbeta-user

    realize File["/home/stillinbeta/sites"]

    file { $gosib::site_dir:
        ensure => directory,
        owner => 'stillinbeta',
    }

    file { "${gosib::site_dir}/gosib":
        ensure => link,
        target => "$gosib::site_dir/gosib-wd/gosib",
        owner => 'stillinbeta' 
    }
}
