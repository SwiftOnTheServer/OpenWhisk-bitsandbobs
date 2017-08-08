<?php
function main(array $args) : array
{
    $name = $args["name"] ?? "stranger";
    return [
        "greeting" => "Hello $name!"
    ];
}
