<?php
/**
 * wsk package create demo
 * wsk action update demo/baseurl baseurl.php --web raw
 * wsk api create /demo/baseurl GET demo/baseurl --response-type http
 *
 */
function main(array $args) : array
{
    return [
        'body' => [
            'x-forwarded-for' => $args['__ow_headers']['x-forwarded-url'],
            // '__ow_headers' => $args['__ow_headers'],
            'args' => $args,
        ],
    ];
}
