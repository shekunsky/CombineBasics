/// When we need to collect (n) items together in array and periodically publishes its items.
/// The time will use an unbounded amount of memory during the interval specified in buffering values provided by upstream publishers.

import Combine
import Foundation

let q = DispatchQueue(label: "Queue")
let numbers = (1...6)
numbers
    .publisher
    .collect(.byTimeOrCount(q, 1.0, 2))
    .sink { print("value : \($0)") }
