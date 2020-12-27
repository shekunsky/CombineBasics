/// When we need to transform elements from an upstream publisher into a new publisher.

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .flatMap {
        Just($0 * 2)
    }
    .sink {
        print("value is: ", $0)
    }
