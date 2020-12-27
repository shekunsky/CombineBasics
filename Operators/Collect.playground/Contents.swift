/// When we need to collect (n) items together in array.

import Combine
import Foundation

let numbers = (1...6)
numbers
    .publisher
    .collect(2)
    .sink { print("value : \($0)") }
