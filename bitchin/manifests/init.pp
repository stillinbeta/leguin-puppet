class bitchin {

    nginx::static { 'bitchin':
        domain    => 'bitchin.stillinbeta.com',
        directory => '/home/stillinbeta/sites/bitchin',
        ssl       => true,
    }

    file { '/home/stillinbeta/sites/bitchin':
        ensure => directory,
        owner => "stillinbeta",
    }

    file { '/home/stillinbeta/sites/bitchin/index.html':
        ensure => file,
        source => "puppet:///modules/bitchin/index.html",
    }
}
