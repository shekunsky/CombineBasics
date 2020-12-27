/// When we need to perform additional configuration or setup prior to producing any elements.
/// This publisher doesn’t produce any elements until you call its connect() / autoConnect() methods.
/// Use makeConnectable() to create a ConnectablePublisher from any publisher whose failure type is Never.

import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()
let connectable = subject.makeConnectable()

connectable.sink(receiveCompletion: { finish in
    switch finish {
    case .finished:
        print("ReceiveCompletion is:", "Finished")
    case .failure(let error):
        print("Error message is:", error.localizedDescription)
    }
}, receiveValue: { value in
    print("ReceiveValue is:", value)
})

subject.send("First value")
subject.send("Second value")
connectable.connect()
subject.send("Third value")
