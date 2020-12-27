/// When we need to combine the latest elements from two publishers.

import Combine
import Foundation

let subject1 = PassthroughSubject<String, Never>()
let subject2 = PassthroughSubject<String, Never>()

Publishers
    .CombineLatest(subject1, subject2)
    .sink {
        print("Value : ", $0)
    }

subject1.send("A")
subject1.send("B")

subject2.send("C")
subject2.send("D")
