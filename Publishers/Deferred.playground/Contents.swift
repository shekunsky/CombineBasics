/// When we need to create the publisher after the subscriber did the subscription to the publisher which means deferring the setup of the publisher until it is actually needed. It is useful when creating an API to return a publisher, where creating the publisher is an expensive effort.

import Combine
import Foundation

let deferredPublisher = Deferred {
    return Future<Bool, Error> { promise in
        print("Do any async call here")
        promise(.success(true))
    }
}.eraseToAnyPublisher()

print("start")

deferredPublisher.sink(
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
