class stillinbeta-user {
    user { 'stillinbeta':
        ensure => "present",
        managehome => true,
    }
}
