/// When we need only to publish the last element of a stream, after the stream finishes.

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .last()
    .sink {
        print("value is: ", $0)
    }
