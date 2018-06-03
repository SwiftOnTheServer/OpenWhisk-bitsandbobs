<?php declare(strict_types=1);

function main(array $args) : array
{
    if (array_key_exists('__ow_body', $args)) {
        $result = 'type of __ow_body: ' . gettype($args['__ow_body']);
    } else {
        $result = '__ow_body was not passed to action';
    }

    return [
        'body' => [
            'result' => $result,
        ]
    ];
}
