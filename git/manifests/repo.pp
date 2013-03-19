define git::repo (
    $repo_name = $title,
    $branch = 'master',
    $service = false,
    $bare_path = "/home/stillinbeta/git/${title}.git",
    $working_path = "/home/stillinbeta/sites/${title}",
    ) {
    require git
    require stillinbeta-user

    if $bare_path =~ /^\/home\/stillinbeta\/git/ {
        realize File["/home/stillinbeta/git"]
    }

    if $working_path =~ /^\/home\/stillinbeta\/sites/ {
        realize File["/home/stillinbeta/sites"]
    }

    # Git init is safe to rerun
    exec { "git_init_${repo_name}":
        command => "${git::git_bin} init --bare $bare_path",
        creates => "$bare_path",
        user => 'stillinbeta',
        notify => File["$bare_path/hooks/post-receive"],
    }

    file { "$bare_path/hooks/post-receive":
        content => template("git/post-receive.erb"),
        mode => "a=rx,ug+w",
        owner => 'stillinbeta',
    }
	
    unless defined(File[$working_path]) {
        file { "$working_path":
            ensure => directory,
            owner => "stillinbeta",
        }
    }
}
