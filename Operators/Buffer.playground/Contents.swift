/// When we need to buffer elements from an upstream publisher by a max number.

import Combine
import Foundation

let numbers = (-1...100)
numbers
    .publisher
    .buffer(size: 3, prefetch: .byRequest, whenFull: .dropOldest)
    .sink { print("value : \($0)") }
