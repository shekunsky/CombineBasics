/// When we need to publish the number of elements received from the upstream publisher.

import Combine
import Foundation

let numbers = ["A1", "A2", "A3"]
numbers
    .publisher
    .count()
    .sink {
        print("Count of numbers publisher is: ", $0)
    }
