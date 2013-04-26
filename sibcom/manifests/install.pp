class sibcom::install {

    gunicorn::django { 'sibcom':
        directory => $sibcom::site_dir,
        domain => 'stillinbeta.com  www.stillinbeta.com',
        static_dir => "${sibcom::site_dir}/sibcom/static",
        default_server => true,
    }

    package { 'python-imaging':
        ensure => installed,
    }

    file { "${sibcom::site_dir}/lib/python2.7/site-packages/PIL":
        ensure => link,
        target => "/usr/lib/python2.7/dist-packages/PIL",
    }

}
