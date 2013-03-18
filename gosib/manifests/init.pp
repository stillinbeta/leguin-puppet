class gosib {

    $site_dir = "/home/stillinbeta/sites/gosib"

    class{ 'gosib::directory': } ->
    class{ 'gosib::configure': } ->
    class{ 'gosib::install': } ->
    Class['gosib']
}
