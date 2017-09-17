func main(args: [String:Any]) -> [String:Any] {

    let corsAllowedOrigin = "http://example.com" // URI that may access this resource ("*" is wildcard)

    // OPTIONS handling for CORS
    guard
        let method = args["__ow_method"] as? String,
        let headers = args["__ow_headers"] as? [String:Any]
    else {
        return ["statusCode": 500]
    }
    if method == "options" {
        let allowedHeaders = headers["access-control-request-headers"] ?? "Content-Type, Authorization"
        return [
            "statusCode": 200,
            "headers": [
                "Access-Control-Allow-Methods": "OPTIONS, GET, PUT, DELETE",
                "Access-Control-Allow-Origin": corsAllowedOrigin,
                "Access-Control-Allow-Headers": allowedHeaders
            ]
        ]
    }

    let data = ["hello": "world"]

    return [
        "statusCode": 200,
        "headers": [
             "Content-Type": "application/json",
             "Access-Control-Allow-Origin": corsAllowedOrigin, // don't forget this header!
         ],
        "body": Data(WhiskJsonUtils.dictionaryToJsonString(jsonDict: data)!.utf8).base64EncodedString()
    ]
}
