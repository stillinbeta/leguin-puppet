class stillinbeta-user {
    user { 'stillinbeta':
        ensure => "present",
        managehome => true,
    }

    @file { "/home/stillinbeta/sites":
        ensure => directory,
        owner => "stillinbeta",
    }
}
