func main(args: [String:Any]) -> [String:Any] {
    let result = Whisk.invoke(actionNamed: "/whisk.system/utils/echo", withParameters: ["name": "Rob"])
    return result ?? ["error": "No result from Whisk.invoke"]
}
