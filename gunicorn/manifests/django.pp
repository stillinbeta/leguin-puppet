define gunicorn::django (
    $site_name = $title,
    $directory,
) {
    include nginx

    python::pip { "$directory-gunicorn":
        virtualenv => $directory
    }

    file { "$directory/django.wsgi":
        ensure => exists,
        contents => template("gunicorn/django.wsgi.erb"),
    }

    file { "/etc/init/$site_name-gunicorn.conf":
        ensure => exists,
        contents => template("gunicorn/django_upstart.conf.erb"),
    }
}
