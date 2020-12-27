/// When we need to emit a Boolean value when a specified element is received from its upstream publisher.

import Combine
import Foundation

let numbers = ["A1", "A2"]
Publishers
    .Contains<Publishers.Sequence<[String], Never>>(upstream: numbers.publisher, output: "A1")
    .sink {
        print("Does numbers contains A1? ", $0)
    }
