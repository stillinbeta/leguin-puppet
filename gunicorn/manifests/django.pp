define gunicorn::django (
    $site_name = $title,
    $domain,
    $directory,
    $static_dir = false,
) {
    include nginx

    python::pip { "$directory-gunicorn":
        virtualenv => $directory
    }

    file { "$directory/django-wsgi.py":
        ensure => file,
        content => template("gunicorn/django.wsgi.erb"),
    }

    file { "/etc/init/$site_name-gunicorn.conf":
        ensure => file,
        content => template("gunicorn/django_upstart.conf.erb"),
    }

    nginx::proxypass { $site_name:
        server_domain => $domain,
        socket => "/tmp/gunicorn-${site_name}.sock",
        static_dir => static_dir,
    }
}
