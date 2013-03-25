define nginx::proxypass (
    $upstream_name = $title,
    $server_domain,
    $socket,
    $static_dir = false,
    $port = 80,
    ) {


    nginx::config { "$upstream_name":
        content => template("nginx/proxypass_template.erb"),
    }
}
