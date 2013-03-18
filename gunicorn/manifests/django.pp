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

    file { "/etc/nginx/sites-available/$title.conf":
        ensure => file,
        content => template("gunicorn/nginx-template.erb"),
        require => Package['nginx'],
    }

    file { "/etc/nginx/sites-enabled/$title.conf":
        ensure => link,
        target => "/etc/nginx/sites-available/$title.conf",
        notify => Service['nginx'],
        require => Package['nginx'],
    }
}
