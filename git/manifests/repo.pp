define git::repo ($name = $title, $branch = 'master', $service = false) {
    require git
    require stillinbeta-user  

    realize File["/home/stillinbeta/git"]
    realize File["/home/stillinbeta/sites"]

    $bare_path = "/home/stillinbeta/git/${name}.git" 
    $working_path = "/home/stillinbeta/sites/${name}" 
    
    # Git init is safe to rerun
    exec { "git_init_${name}":
        command => "${git::git_bin} init --bare $bare_path",
	creates => "$bare_path",
        user => 'stillinbeta',
    }

    file { "$bare_path/hooks/post-receive":
        content => template("git/post-receive.erb"),
        mode => "a=rx,ug+w",
        owner => 'stillinbeta',
    }

    file { "$working_path":
        ensure => directory,
        owner => "stillinbeta",
    }
}
