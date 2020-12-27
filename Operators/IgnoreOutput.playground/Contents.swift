/// When we need to ignore all upstream elements, but passes along a completion state (finish or failed).

import Combine
import Foundation

let numbers = [1, 2, 3]
numbers
    .publisher
    .ignoreOutput()
    .sink(receiveCompletion: {
        print("receiveCompletion", $0)
    }, receiveValue: {
        print("value is: ", $0)
    })
