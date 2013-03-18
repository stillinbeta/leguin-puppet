class gosib::install {

    gunicorn::django { 'gosib':
        directory => $gosib::site_dir,
    }
}
