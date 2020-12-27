/// When we need to wrap asynchronous logic and convert it into a publisher. Like when we need to ask the user for contact permission.

import Combine
import Foundation
import Contacts

let contactPublisher = Future<Bool, Error> { promise in
    CNContactStore().requestAccess(for: .contacts) { grantedAccess, error in
        if let error = error {
            promise(.failure(error))
        }
        return promise(.success(grantedAccess))
    }
}


contactPublisher.sink(
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
