define gunicorn::django (
    $name = $title,
    $directory,
) {
    include nginx;

    python::pip { "$directory-gunicorn":
        virtualenv => $directory
    }

    file { "$directory/django.wsgi":
        ensure => exists,
        contents => template("gunicorn/django.wsgi.erb"),
    }

    file { "/etc/init/$name-gunicorn.conf":
        ensure => exists,
        contents => template("gunicorn/django_upstart.conf.erb"),
    }
}
