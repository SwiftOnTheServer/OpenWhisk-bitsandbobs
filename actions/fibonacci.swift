func fibonacci(_ n: Int) -> Int {
    // Some temporary variables.
    var a = 0
    var b = 1
    // Add up numbers to the desired iteration.
    for _ in 0..<n {
        let temp = a
        a = b
        b = temp + b
    }
    return a
}


// func fibonacci(_ i: Int) -> Int {
//     if i <= 2 {
//         return 1
//     } else {
//         return fibonacci(i - 1) + fibonacci(i - 2)
//     }
// }

func main(args: [String:Any]) -> [String:Any] {
    guard let n = args["n"] as? Int else {
        return ["error": "Error: No number supplied"]
    }

    return ["result": fibonacci(n)]
}
