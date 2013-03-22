class sibcom {

    $site_dir = "/home/stillinbeta/sites/sibcom"

    class{ 'sibcom::directory': } ->
    class{ 'sibcom::configure': } ->
    class{ 'sibcom::install': } ->
    Class['sibcom']
}
