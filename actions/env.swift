//
// wsk action update envswift env.swift --web true
//
// curl https://openwhisk.ng.bluemix.net/api/v1/web/19FT_dev/default/envswift.json | jq -S
// curl -k https://192.168.33.13/api/v1/web/guest/default/envswift.json | jq -S
//
func main(args: [String:Any]) -> [String:Any] {
    var env = ProcessInfo.processInfo.environment
    env["__OW_API_KEY"] = "**REDACTED**"
    return [
        "args": args,
        "env" : env,
    ]
}
