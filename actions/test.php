<?php
function main($params) {
    var_dump($params);
    return [
        'outer_type' => gettype($params['payload']),
        'inner_type' => gettype($params['payload']->inner),
    ];
}
