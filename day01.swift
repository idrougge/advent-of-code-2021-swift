/* Advent of code 2021, day 1, part 1+2 in Swift 5 */

import Foundation

let input = try! String(contentsOfFile: "day01.txt")
    .components(separatedBy: "\n")
    .compactMap(Int.init)

func part1() -> Int {
    zip(input, input.dropFirst())
        .reduce(0) { sum, input in input.1 > input.0 ? sum + 1 : sum }
}

func part2() -> Int {
    let inputs = zip(zip(input, input.dropFirst()), input.dropFirst().dropFirst())
        .map { ($0.0 + $0.1 + $1) }
    var nr = 0
    var previous = Int.max
    for input in inputs {
        if input > previous {
            nr += 1
        }
        previous = input
    }
    return nr
}

print(part1())
print(part2())
