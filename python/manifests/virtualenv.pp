define python::virtualenv (
    $venv_path = $title,
    $python = 'python2.7',
    $system_packages = true,
    $packages = false) {

    include python
    realize Package['python-virtualenv']


    if $system_packages {
        $system_pkg_arg = '--system-site-packages'
    } else {
        $system_pkg_arg = ''
    }

    $venv_bin = '/usr/bin/virtualenv'

    exec { "virtualenv_$title":
        creates => ["$venv_path/lib", "$venv_path/include", "$venv_path/bin"],
        command => "$venv_bin $system_pkg_arg -p $python $venv_path",
    }

    if $packages {
        # We need titles to be unique globally, so you can install
        # a package in more than one submodule.
        $packages_sub = regsubst($packages, '^', "$venv_path-")

        python::pip { $packages_sub:
            virtualenv => $venv_path,
            require => Exec["virtualenv_$title"],
        }
    }
}
