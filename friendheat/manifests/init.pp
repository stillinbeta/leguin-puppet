class friendheat {
    require stillinbeta-user

    $site_path = '/home/stillinbeta/sites/friendheat'

    git::repo {'friendheat':
        service => 'friendheat-tornado',
        working_path => "$site_path",
    }

    python::virtualenv { $site_path:
        packages => ['tornado', 'sqlite3dbm']
    }

    file { '/etc/init/friendheat-tornado.conf':
        ensure => file,
        source => 'puppet:///modules/friendheat/friendheat-tornado.conf',
    }

    nginx::proxypass { "friendheat":
        server_domain => 'friendheat.stillinbeta.com',
        socket        => '/tmp/friendheat-tornado.socket',
        static_dir    => "$site_path/static",
        ssl           => true,
    }
}
