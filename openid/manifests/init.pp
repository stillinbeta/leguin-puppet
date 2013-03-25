class openid {

    nginx::static { 'openid':
        domain => 'openid.stillinbeta.com',
        directory => '/home/stillinbeta/sites/openid',
    }
}

