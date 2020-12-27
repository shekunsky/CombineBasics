/// When we need to publish the first element of a stream, then finishes.

import Combine
import Foundation

let numbers = ["A1", "B1", "A2"]
numbers
    .publisher
    .first()
    .sink {
        print("value is: ", $0)
    }
