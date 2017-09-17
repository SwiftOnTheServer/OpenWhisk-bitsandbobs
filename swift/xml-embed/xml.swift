//
// $ wsk action update xml xml.swift --web true
//
/*
    $ curl -i -H "Content-type: application/xml" -d "<root><foo>bar</foo></root>" \
    https://openwhisk.eu-gb.bluemix.net/api/v1/web/19FT_demo/default/xml.json
*/

func main(args: [String:Any]) -> [String:Any]
{
    let body  = args["__ow_body"] as? String ?? ""
    let headers = args["__ow_headers"] as? [String:Any] ?? [:]


    do {
        let xmlDoc = try AEXMLDocument(xml: body)
        
        return [
            "body": [
                "foo": xmlDoc.root["foo"].string,
                "headers": headers,
                "args": args,
            ]
        ]

    } catch {
        return ["error": error]
    }

}
