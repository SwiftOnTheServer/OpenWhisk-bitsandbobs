<?php

function main(array $args) : array
{
    $corsAllowedOrigin = "http://example.com"; // URI that may access this resource ("*" is wildcard)

    // OPTIONS handling for CORS
    $method = $args["__ow_method"] ?? "";
    $headers = $args["__ow_headers"] ?? [];
    if ($method == "options") {
        $allowedHeaders = $headers["access-control-request-headers"] ?? "Content-Type, Authorization";
        return [
            "statusCode" => 200,
            "headers" => [
                "Access-Control-Allow-Methods" => "OPTIONS, GET, PUT, DELETE",
                "Access-Control-Allow-Origin" => $corsAllowedOrigin,
                "Access-Control-Allow-Headers" => $allowedHeaders
            ]
        ];
    }

    $data = ["hello" => "world"];

    return [
        "statusCode" => 200,
        "headers" => [
             "Content-Type" => "application/json",
             "Access-Control-Allow-Origin" => $corsAllowedOrigin, // don't forget this header!
         ],
        "body" => base64_encode(json_encode($data))
    ];
}



// function main(array $args) : array
// {
//     return [
//         'hello' => 'world'
//     ];
// }
