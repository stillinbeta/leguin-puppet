define python::pip ($package = $title, $virtualenv = false) {
    include python

    if $virtualenv {
        $package_unsub = regsubst($package, "^($virtualenv-)", "")

        $pip_bin = "$virtualenv/bin/pip"

        exec { "$package-pip":
            command => "$pip_bin install $package_unsub",
            unless => "$pip_bin freeze | grep -q $package_unsub",
        }

    } else {
        package { "$package":
            provider => 'pip',
        }
    }
}

