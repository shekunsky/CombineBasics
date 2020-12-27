/// When we need to deliver elements to its downstream subscriber on a specific scheduler.

import Combine
import Foundation

let numbers = ["First", "Second", "Third"]
numbers
    .publisher
    .receive(on: RunLoop.main)
    .sink {
        print("value is: ", $0)
    }
