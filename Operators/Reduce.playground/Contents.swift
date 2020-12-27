/// When we need to apply a closure to all received elements and produces an accumulated value when the upstream publisher finishes.

import Combine
import Foundation

func sum(_ lastValue: Int, _ currentValue: Int) -> Int {
    return (lastValue + currentValue)
}

let numbers = [1,2,3,4,5,0,6,7,8,9]
numbers.publisher
    .reduce(10) {  sum($0, $1) }
    .sink(
        receiveCompletion: { print ("\($0)") },
        receiveValue: { print ("\($0)", terminator: " ") }
    )
