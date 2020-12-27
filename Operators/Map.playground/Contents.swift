/// When we need to transform all elements from the upstream publisher with a provided closure.

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .map { "A\($0)" }
    .sink {
        print("value is: ", $0)
    }
