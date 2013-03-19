class sibcom::configure {

    git::repo {'sibcom':
        service => 'sibcom-gunicorn',
        working_path => "${sibcom::site_dir}/sibcom",
    }

    python::virtualenv { $sibcom::site_dir:
        packages => ['django']
    }

    file { "${sibcom::site_dir}/lib/python2.7/site-packages/PIL":
        ensure => link,
        target => "/usr/lib/python2.7/dist-packages/PIL",
    }

    cron { sibcom-update:
       command => "/home/stillinbeta/sites/sibcom/bin/python /home/stillinbeta/sites/sibcom/sibcom/update.py",
       user => "stillinbeta",
       minute => [5, 35],
    }
}
