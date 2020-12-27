/// When we need to republish all elements that match a provided closure.

import Combine
import Foundation

let numbers = ["A1", "B1", "A2"]
numbers
    .publisher
    .filter { $0.contains("A") }
    .sink {
        print("value is: ", $0)
    }
