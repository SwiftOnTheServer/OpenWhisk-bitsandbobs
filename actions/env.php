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
    echo "-------------- env: --------------\n";
    var_dump($env);

    echo "-------------- args: --------------\n";
    var_dump($args);

    $env["__OW_API_KEY"] = "**REDACTED**";

    $body = null;
    if (isset($args['__ow_body'])) {
        echo "-------------- __ow_body: --------------\n";
        var_dump($args['__ow_body']);
        $body = base64_decode($args['__ow_body']);
        echo "-------------- base64 decoded body: --------------\n";
        var_dump($body);
        $body = json_decode($body);
        echo "-------------- body: --------------\n";
        var_dump($body);
    }
    return [
        'body' => [
            'args' => $args,
            'env' => $env,
            'body' => $body,
        ]
    ];
}
