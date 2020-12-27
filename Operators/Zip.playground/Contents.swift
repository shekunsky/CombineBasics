/// When we need to combine the latest elements from two publishers and emit a tuple to the downstream.

import Combine
import Foundation

let numbersPub = PassthroughSubject<Int, Never>()
let lettersPub = PassthroughSubject<String, Never>()

let cancellable = numbersPub
    .zip(lettersPub)
    .sink { print("\($0)") }

numbersPub.send(1)
numbersPub.send(2)
lettersPub.send("A")
numbersPub.send(3)
lettersPub.send("B")
