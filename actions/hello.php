<?php
function main(array $args) : array
{
    return [
        "body" => ["greeting" => "Hello world"],
        "headers" => ["Content-Type" => "application/hal+json"],
    ];
}
