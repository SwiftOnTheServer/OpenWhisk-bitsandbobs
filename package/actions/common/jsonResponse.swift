func jsonResponse(_ data: [String:Any], code: Int = 200, headers: [String:String] = [:]) -> [String:Any] {
    let env = ProcessInfo.processInfo.environment
    guard let whiskInput = env["WHISK_INPUT"] else {
        // This is a normal action, not a web action so we can just return the data
        return data
    }

    var headers = headers
    headers["Content-Type"] = "application/json"
    headers["Access-Control-Allow-Origin"] = "*"

    let json = WhiskJsonUtils.dictionaryToJsonString(jsonDict: data) ?? ""
    let body = Data(json.utf8).base64EncodedString()

    return [
        "body": body,
        "statusCode": code,
        "headers": headers,
    ]
}
