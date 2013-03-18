class gosib::configure {

    git::repo {'gosib':
        service => 'gosib-gunicorn',
        working_dir => '/home/stillinbeta/sites/gosib/gosib',
        requires => File["$gosib::site_dir"],
    }

    python::virtualenv { $gosib::site_dir:
        packages => ['django']
    }
}
