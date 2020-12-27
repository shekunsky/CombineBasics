/// When we need to selectively republish elements from an upstream publisher during an interval you specify.

import Combine
import Foundation

let cancellable = Timer.publish(every: 1.0, on: .main, in: .default)
    .autoconnect()
    .print("\(Date())")
    .throttle(for: 3.0, scheduler: RunLoop.main, latest: true)
    .sink(
        receiveValue: { print("Received Timestamp \($0).") }
    )
