func main(args: [String:Any]) -> [String:Any] {
    let name = args["name"] ?? "world"
    print("Hello \(name)")

    return ["msg": "Hello \(name)"]
}
