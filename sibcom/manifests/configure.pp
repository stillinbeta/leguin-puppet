class sibcom::configure {

    git::repo {'sibcom':
        service => 'sibcom-gunicorn',
        working_path => "${sibcom::site_dir}/sibcom",
    }

    python::virtualenv { $sibcom::site_dir:
        packages => ['django',
                     'python-openid',
                     'django-openid-auth',
                     'django-openid-provider']
    }

    cron { sibcom-update:
       command => "/home/stillinbeta/sites/sibcom/bin/python /home/stillinbeta/sites/sibcom/sibcom/update.py",
       user => "stillinbeta",
       minute => [5, 35],
    }
}
