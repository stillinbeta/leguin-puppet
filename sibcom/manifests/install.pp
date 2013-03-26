class sibcom::install {

    gunicorn::django { 'sibcom':
        directory => $sibcom::site_dir,
        domain => 'stillinbeta.com',
        static_dir => "${sibcom::site_dir}/sibcom/static",
    }

    package { 'python-imaging':
        ensure => installed,
    }

    file { "${sibcom::site_dir}/lib/python2.7/site-packages/PIL":
        ensure => link,
        target => "/usr/lib/python2.7/dist-packages/PIL",
    }

}
