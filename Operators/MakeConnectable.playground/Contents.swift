/// When we need to provide explicit connectability to another publisher.

import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()
let connectable = subject.makeConnectable()

connectable.sink {
    print("value is: ", $0)
}

subject.send("A1")
subject.send("A2")

connectable.connect()
subject.send("B1")
