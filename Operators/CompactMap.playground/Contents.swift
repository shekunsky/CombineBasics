/// When we need to republish all non-nil results of calling a closure with each received element.

import Combine
import Foundation

let letters = ["A", "B", "C", nil, "D", nil]
letters
    .publisher
    .compactMap { $0 }
    .sink {
        print("Value : ", $0)
    }
