/// When we need to emit all of one publisher’s elements before those from another publisher.

import Combine
import Foundation

let numbers1 = ["A1", "A2"]
let numbers2 = ["B1", "B2"]

Publishers
    .Concatenate.init(prefix: numbers1.publisher, suffix: numbers2.publisher)
    .sink { a in
        print("Value is:", a)
    }
