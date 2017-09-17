// Rock Paper Scissors game
// To install:
//    $ wsk action update rock-paper-scissors rock-paper-scissors.swift
//
// To play:
//    $ wsk action invoke rock-paper-scissors -r -p shape rock

import Foundation

func main(args: [String:Any]) -> [String:Any] {
    let shapes = ["rock", "paper", "scissors"]

    // retrieve your shape
    guard let yourShape = args["shape"] as? String,
        let yourShapeIndex = shapes.index(of: yourShape) else {
        return ["error": "Please provide a shape ('rock', 'paper' or 'scissors'"]
    }

    // determine my shape
    srandom(UInt32(NSDate().timeIntervalSince1970))
    let myShapeIndex = random() % shapes.count
    let myShape = shapes[myShapeIndex]

    // who won?
    if yourShapeIndex == myShapeIndex {
        return [ "winner" : "tie", "your_shape": yourShape, "my_shape": myShape ]
    } else if ((yourShapeIndex + 1) % 3)  == myShapeIndex {
        return [ "winner" : "me", "your_shape": yourShape, "my_shape": myShape ]
    }
    return [ "winner" : "you", "your_shape": yourShape, "my_shape": myShape ]
}
