/* Advent of code 2021, day 2, part 1+2 in Swift 5 */

import Foundation

enum Command {
    case horizontal(Int)
    case vertical(Int)

    init(rawValue: String) {
        let values = rawValue.components(separatedBy: " ")
        let number = Int(values[1])!
        switch values[0] {
            case "forward": self = .horizontal(number)
            case "up": self = .vertical(-number)
            case "down": self = .vertical(number)
            case _: preconditionFailure()
        }
    }
}

let input = try! String(contentsOfFile: "day02.txt")
    .components(separatedBy: "\n")
    .map(Command.init)

var aim = 0
var depth = 0
var position = 0

for command in input {
    switch command {
        case .horizontal(let units): 
            position += units
            depth += aim * units
        case .vertical(let units): aim += units
    }
}

print(aim * position)
print(depth * position)