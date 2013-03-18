class gosib::install {

    gunicorn::django { 'gosib':
        directory => $gosib::site_dir,
	domain => 'go.stillinbeta.com',
	static_dir => "${gosib::site_dir}/gosib/static",
    }
}
