//
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/ping.http"
//

func main(args: [String:Any]) -> [String:Any] {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
    let now = formatter.string(from: Date())

    let data = ["ack": "\(now)"]

    return [
        "body": data,
        "code": 200,
        "headers": [
            "Content-Type": "application/json",
        ],
    ]
}
