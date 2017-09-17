
func main(args: [String:Any]) -> [String:Any]
{
    let cards = [
        "cards": [
            [ "id": 1, "side_a": "2+2", "side_b": "4" ],
            [ "id": 2, "side_a": "3+3", "side_b": "6" ],
        ]
    ]

    return [
        "statusCode": 200,
        "headers": [
            "Content-Type": "application/json",
        ],
        "body": cards,
    ]
}
