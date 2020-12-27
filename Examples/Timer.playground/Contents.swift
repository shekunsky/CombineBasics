/// Create a Timer

import Combine
import UIKit

var bag = Set<AnyCancellable>()
let queue = DispatchQueue(label: "Queue", qos: .background)

Timer.publish(every: 1, on: RunLoop.main, in: .default)
    .autoconnect()
    .receive(on: queue)
    .sink {
        print("Time is: ", $0)
    }.store(in: &bag)
