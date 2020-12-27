/// When we need to loop on all the publisher’s elements and return a Boolean value indicating whether every element of a sequence satisfies a given predicate.

import Combine
import Foundation

let targetRange = (-1...100)
let numbers = [-1, 0, 10, 5]
numbers
    .publisher
    .allSatisfy { targetRange.contains($0) }
    .sink { print("Does all satisfy? : \($0)") }
