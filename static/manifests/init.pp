class static {

    nginx::static { 'static':
        domain    => 'static.stillinbeta.com',
        directory => '/home/stillinbeta/sites/static',
        ssl       => true,
    }
}
