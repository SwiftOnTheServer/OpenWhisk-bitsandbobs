func main(args: [String:Any]) -> [String:Any] {
    return [
        "headers": [
            "Content-type": "text/html",
            "X-Clacks-Overhead": "GNU Terry Pratchett",
        ],
        "body": "<h1>Hello world!</h1>",
    ]
}


    // return ["html": "<h1>Hello world</h1>"]
/*

wsk action update htmltest html.swift --web true

curl https://openwhisk.ng.bluemix.net/api/v1/web/19FT_dev/default/htmltest.html

 */
