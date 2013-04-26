define nginx::proxypass (
    $upstream_name = $title,
    $server_domain,
    $socket,
    $static_dir = false,
    $port = 80,
    $ipv6 = true,
    $default_server = false,
    ) {


    nginx::config { "$upstream_name":
        content => template("nginx/proxypass_template.erb"),
    }
}
