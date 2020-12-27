/// When we need applying the merge function to two upstream publishers.

import Combine
import Foundation

let numbers = [1, 2, 3]
let numbers2 = [4, 5, 6]

numbers.publisher
    .merge(with: numbers2.publisher)
    .sink {
        print("value is: ", $0)
    }
