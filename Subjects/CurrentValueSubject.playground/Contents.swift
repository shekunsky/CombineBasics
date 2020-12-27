/// When we need to wrap a single value and publishes a new element whenever the value changes.
/// When we need to make a publisher that sends values over the time but never completes.

import Combine
import Foundation

let subject = CurrentValueSubject<String, Error>("Initial value")

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
