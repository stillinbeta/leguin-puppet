class statusbot {

    $site_dir = "/home/stillinbeta/statusbot"

    git::repo {'statusbot':
        service => 'statusbot',
        working_path => "$site_dir",
    }

    python::virtualenv { $site_dir:
        packages => ['Twisted==13.0.0'
                     'httplib2==0.8',
                     'oauth2==1.5.170',
                     'pyOpenSSL==0.13',
                     'wokkel==0.7.1',
                     'wsgiref==0.1.2',
                     'zope.interface==3.6']
    }

    file { "/etc/init/statusbot.conf":
        ensure => exists,
        contents => template('statusbot/upstart.conf.erb')
    }
}
