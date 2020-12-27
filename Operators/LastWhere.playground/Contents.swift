/// When we need only to publish the last element of a stream that satisfies a predicate closure, once the stream finishes.

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .last { $0 > 2 }
    .sink {
        print("value is: ", $0)
    }
