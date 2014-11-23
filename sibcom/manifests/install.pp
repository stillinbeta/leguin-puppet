class sibcom::install {

    $well_known_dir = "${sibcom::site_dir}/sibcom/well-known"

    gunicorn::django { 'sibcom':
        directory      => $sibcom::site_dir,
        domain         => 'stillinbeta.com  www.stillinbeta.com',
        static_dir     => "${sibcom::site_dir}/sibcom/static",
        default_server => true,
        ssl            => true,
        extra          => template("sibcom/well_known.erb"),
    }

    package { 'python-imaging':
        ensure => installed,
    }

    file { "${sibcom::site_dir}/lib/python2.7/site-packages/PIL":
        ensure => link,
        target => "/usr/lib/python2.7/dist-packages/PIL",
    }

}
