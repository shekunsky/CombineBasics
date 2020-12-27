/// When we need to perform the specified closures when publisher events occur.

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .handleEvents(receiveSubscription: {
        print("receiveSubscription", $0)
    }, receiveOutput: {
        print("receiveOutput", $0)
    }, receiveCompletion: {
        print("receiveCompletion", $0)
    }, receiveCancel: {
        print("receiveCancel")
    }, receiveRequest: {
        print("receiveRequest demand", $0)
    })
    .sink {
        print("value is: ", $0)
    }
