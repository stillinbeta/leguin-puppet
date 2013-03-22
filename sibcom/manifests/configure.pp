class sibcom::configure {

    git::repo {'sibcom':
        service => 'sibcom-gunicorn',
        working_path => '/home/stillinbeta/sites/sibcom',
    }

    python::virtualenv { $sibcom::site_dir:
        packages => ['django==1.3.7', 'PIL']
    }
}
