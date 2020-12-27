/// When we need to publish only elements that don’t match the previous element.

import Combine
import Foundation

let numbers = ["First", "First", "Third"]
numbers
    .publisher
    .removeDuplicates()
    .sink {
        print("value is: ", $0)
    }
