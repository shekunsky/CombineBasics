/// When we need to decide how to handle from an upstream publisher by either replacing the publisher with a new publisher, or throwing a new error.

import Combine
import Foundation

enum SimpleError: Error { case error }
var numbers = [5, 4, 3, 2, 1, -1, 7, 8, 9, 10]

numbers.publisher
    .tryMap { v in
        if v > 0 {
            return v
        } else {
            throw SimpleError.error
        }
    }
    .tryCatch { error in
        Just(0)
    }
    .sink(receiveCompletion: { print ("Completion: \($0).") },
          receiveValue: { print ("Received \($0).") }
    )
