class gosib {

    $site_dir = "/home/stillinbeta/sites/gosib"

    include gosib::directory
    include gosib::configure
    include gosib::install

    Class['gosib::directory'] ->
    Class['gosib:configure'] ->
    Class['gosib:install'] ->
    Class['gosib']
}
