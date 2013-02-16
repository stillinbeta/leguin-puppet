class python {
    package { 'python':
        ensure => installed,
    }

    @package { "python-virtualenv":
        ensure => installed,
    }
}
