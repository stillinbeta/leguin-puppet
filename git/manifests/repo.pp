define git::repo (
    $repo_name = $title,
    $branch = 'master',
    $service = false,
    $bare_path = false,
    $working_path = false,
    ) {
    require git
    require stillinbeta-user

    unless $bare_path {
        realize File["/home/stillinbeta/git"]

        $bare_path = "/home/stillinbeta/git/${repo_name}.git"
    }
    unless $working_path {
        realize File["/home/stillinbeta/sites"]
        $working_path = "/home/stillinbeta/sites/${repo_name}"
    }

    # Git init is safe to rerun
    exec { "git_init_${repo_name}":
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
