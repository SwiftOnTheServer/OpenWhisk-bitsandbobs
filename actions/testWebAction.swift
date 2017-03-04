//
// Testing returning an error when invoked as a Web Action
//
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/testWebAction.http"
//

func main(args: [String:Any]) -> [String:Any] {

    let data = [
            "name": "Rob Allen",
            "error": "An error occurred"
        ]
    let json_body = WhiskJsonUtils.dictionaryToJsonString(jsonDict: data) ?? ""
    let base64_body = Data(json_body.utf8).base64EncodedString()

    return [
        "body": base64_body,
        "code": 400,
        "headers": [
            "Content-Type": "application/json"
        ]
    ]
}
