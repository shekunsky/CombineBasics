/// When we need to broadcast the elements to downstream subscribers.
/// When we don’t need any initial value or a buffer of the most recently published element.

import Combine
import Foundation

let subject = PassthroughSubject<String, Never>()

subject.sink(
    receiveCompletion: { finish in
        switch finish {
        case .finished:
            print("ReceiveCompletion is:", "Finished")
        case .failure(let error):
            print("Error message is:", error.localizedDescription)
        }
    },
    receiveValue: { value in
        print("ReceiveValue is:", value)
    })

subject.send("First value")
subject.send("Second value")

subject.sink(
    receiveCompletion: { finish in
        switch finish {
        case .finished:
            print("ReceiveCompletion is:", "Finished")
        case .failure(let error):
            print("Error message is:", error.localizedDescription)
        }
    },
    receiveValue: { value in
        print("ReceiveValue on subscriber#2:", value)
    })
