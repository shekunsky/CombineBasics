/// When we need to emit an output to each subscriber just once, and then finishes.

import Combine
import Foundation

let publisher = Just("One")
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
