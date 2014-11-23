class rockt {
    $site_dir = '/home/stillinbeta/sites/rockt'

    git::repo { 'rockt':
        working_path => "$site_dir",
    }

    nginx::static { 'rockt':
        domain    => 'rockt.stillinbeta.com',
        directory => "$site_dir",
        ssl       => true,
    }
}
