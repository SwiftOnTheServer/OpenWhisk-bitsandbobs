//
// curl "https://openwhisk.ng.bluemix.net/api/v1/experimental/web/19FT_dev/default/env.json"
//
func main(args: [String:Any]) -> [String:Any] {
    let env = ProcessInfo.processInfo.environment
    return env
}
