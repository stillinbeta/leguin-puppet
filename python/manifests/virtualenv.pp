define python::virtualenv (
    $venv_path = $title,
    $python = 'python2.7',
    $packages = false) {

    include python
    realize Package['python-virtualenv']

    $venv_bin = '/usr/bin/virtualenv'

    exec { "virtualenv_$title":
        #creates => ["$venv_path/lib", "$venv_path/include", "$venv_path/bin"],
        command => "$venv_bin -p $python $venv_path",
    }

    if $packages {
        # We need titles to be unique globally, so you can install
        # a package in more than one submodule.
        $packages_sub = regsubst($packages, '^', "$venv_path-")

        python::pip { $packages_sub:
            virtualenv => $venv_path,
	    require => Exec["virtualenv_$title"]
        }
    }
}
            
            
        
    

