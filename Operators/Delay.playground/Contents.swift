/// When we need to delay the delivery of the elements and the completion to the downstream receiver.

import Combine
import Foundation

let numbers = [1, 2, 3]
let queue = DispatchQueue(label: "queue", qos: .background)

print("Time now is: ",Date())

numbers
    .publisher
    .delay(for: .seconds(5), scheduler: queue)
    .sink(receiveCompletion: { _ in
        print("Finished at time: ", Date())
    }, receiveValue: {
        print("value: is", $0, "at time: ", Date())
    })
