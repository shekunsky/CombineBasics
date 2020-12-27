/// When we need never to publish any values, and optionally finishes immediately.

import Combine
import Foundation

let publisher = Empty<String, Never>()
publisher.sink(
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
