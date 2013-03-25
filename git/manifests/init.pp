class git {
    require stillinbeta-user

    package { "git":
        ensure => installed,
    }

    @file { "/home/stillinbeta/git":
        ensure => directory,
        owner => "stillinbeta",
    }

    $git_bin = "/usr/bin/git"
}
