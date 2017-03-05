//
// Making a POST request within an OpenWhisk action
//

import KituraNet
import SwiftyJSON

func main(args: [String:Any]) -> [String:Any] {

    let url = "http://httpbin.org/post"
    let dataToSend = ["foo": ["bar": "baz"]]

    var result: [String:Any] = ["result": "No response"]
    postJsonTo(url, data: dataToSend) { response in
        do {
            let str = try response!.readString()!
            if let jsonDictionary = JSON.parse(string: str).dictionaryObject {
                result = jsonDictionary
            }
        } catch {
            print("Error \(error)")
        }
    }

    return result
}

func postJsonTo(_ url: String, data: [String:Any], callback: @escaping ClientRequest.Callback) {
    let jsonBody = WhiskJsonUtils.dictionaryToJsonString(jsonDict: data) ?? ""
    let base64Body = Data(jsonBody.utf8)
    postTo(url, body: base64Body, headers: ["Content-Type": "application/json"], callback: callback)
}

func postTo(_ url: String, body: Data, headers: [String: String], callback: @escaping ClientRequest.Callback)  {
    var options: [ClientRequest.Options] = [
        .schema(""),
        .method("POST"),
        .hostname(url),
        .headers(headers)
    ]

    var result: [String:Any] = ["result": "No response"]

    let request = HTTP.request(options, callback: callback)
    request.write(from: body)
    request.end() // send request
}
