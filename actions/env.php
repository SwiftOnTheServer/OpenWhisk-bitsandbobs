<?php
//
// wsk action update envphp env.php --web true --kind php:7.1
//
// curl https://openwhisk.ng.bluemix.net/api/v1/web/19FT_dev/default/envphp.json | jq -S
// curl -k https://192.168.33.13/api/v1/web/guest/default/envphp.json | jq -S
//

function main(array $args) : array
{
    $env = $_ENV;
    echo "env:";
    var_dump($env);

    echo "args:";
    var_dump($args);

    $env["__OW_API_KEY"] = "**REDACTED**";
    return [
        'args' => $args,
        'env' => $env,
    ];
}
