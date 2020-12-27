/// When we need to omit a specified number of elements before republishing later elements.

import Combine
import Foundation

let numbers = ["A1", "A2", "A3"]
numbers
    .publisher
    .dropFirst(2)
    .sink {
        print("value is: ", $0)
    }
