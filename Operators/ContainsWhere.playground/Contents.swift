/// When we need to emits a Boolean value upon receiving an element that satisfies the predicate closure.

import Combine
import Foundation

let numbers = ["A1", "A2"]
numbers
    .publisher
    .contains { $0 == "A" }
    .sink {
        print("Does numbers containts A?: ", $0)
    }
