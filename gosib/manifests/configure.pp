class gosib::configure {

    git::repo {'gosib':
        service => 'gosib-gunicorn',
        working_path => '/home/stillinbeta/sites/gosib/gosib-wd',
    }

    python::virtualenv { $gosib::site_dir:
        packages => ['django']
    }
}
