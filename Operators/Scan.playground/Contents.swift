/// When we need to accumulate all previously-published values into a single value, which you then combine with each newly-published value.

import Combine
import Foundation

let range = (0...5)
range.publisher
    .scan(0) { return $0 + $1 }
    .sink { print ("\($0)", terminator: " ") }
