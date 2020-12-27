/// When we need to ignore elements from the upstream publisher until it receives an element from second publisher.

import Combine
import Foundation

let subject1 = PassthroughSubject<String, Never>()
let subject2 = PassthroughSubject<String, Never>()

subject1
    .drop(untilOutputFrom: subject2)
    .sink {
        print("value is: ", $0)
    }

subject1.send("A1")
subject1.send("A2")
subject2.send("B1")
subject1.send("A3")
subject1.send("A4")
