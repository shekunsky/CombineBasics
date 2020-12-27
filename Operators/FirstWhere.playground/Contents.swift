/// When we need only to publish the first element of a stream to satisfy a predicate closure.

import Combine
import Foundation

let numbers = ["A1", "B1", "A2"]
numbers
    .publisher
    .first { $0.contains("A") }
    .sink {
        print("value is: ", $0)
    }
