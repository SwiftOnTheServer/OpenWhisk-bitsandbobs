//
// Authenticated POST call:
// $ AUTH=$(wsk property get --auth | awk '{printf("%s", $3)}' | openssl base64 | tr -d "\n")
// $ curl -X POST -H "Authorization: Basic $AUTH" "https://openwhisk.ng.bluemix.net/api/v1/namespaces/19FT_dev/actions/test?blocking=true&result=true"
//
// Web Action call:
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/detectWebAction.json"
//

func main(args: [String:Any]) -> [String:Any] {

    if args["__ow_meta_verb"] == nil {
        return ["root": "Hello world"]
    }
    return [
        "body": "<root>Hello world</root>",
        "code": 200,
        "headers": [
            "Content-Type": "text/xml",
        ],
    ]
}
