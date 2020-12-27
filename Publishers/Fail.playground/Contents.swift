/// When we need to terminates with the specified error.

import Combine
import Foundation

enum ApiError: Error {
    case invalidJSON
    
    var localizedDescription: String {
        switch self  {
        case .invalidJSON:
            return "invalid JSON"
        }
    }
}

let publisher = Fail<String, ApiError>(error: ApiError.invalidJSON)
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
