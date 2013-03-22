class sibcom::install {

    gunicorn::django { 'sibcom':
        directory => $sibcom::site_dir,
        domain => 'stillinbeta.com',
        static_dir => "${sibcom::site_dir}/sibcom/static",
    }
}
