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

    do {
        let xmlDoc = try AEXMLDocument(xml: body)
        
        return [
            "body": xmlDoc.root["foo"].string,
            // "args": args,
        ]

    } catch {
        return ["error": error]
    }

}
