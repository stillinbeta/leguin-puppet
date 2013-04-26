class statusbot {

    $site_dir = "/home/stillinbeta/statusbot"

    git::repo {'statusbot':
        service => 'statusbot',
        working_path => "$site_dir",
    }

    python::virtualenv { $site_dir:
        packages => ['httplib2==0.8',
                     'oauth2==1.5.170',
                     'zope.interface==3.6'],
        system_packages => true,
    }

    package { ['python-twisted-core', 
               'python-twisted-runner',
               'python-twisted-words',
               'python-twisted-web',
               'python-openssl',
               'python-wokkel']:
        ensure => 'installed',
    }

    file { "/etc/init/statusbot.conf":
        ensure => file,
        content => template('statusbot/upstart.conf.erb')
    }
}
