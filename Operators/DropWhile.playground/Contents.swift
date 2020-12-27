/// When we need to omit elements from an upstream publisher until a given closure returns false.

import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()

subject
    .drop {
        $0.contains("A")
    }
    .sink {
        print("value is: ", $0)
    }

subject.send("A1")
subject.send("A2")
subject.send("B1")
subject.send("B2")
