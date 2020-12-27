/// When we need to republish items from another publisher only if each new item is in increasing order from the previously-published item.

import Combine
import Foundation

let numbers = [4, 1, 2, 0, 3]
let publisher = Publishers
    .Comparison<Publishers.Sequence<[Int], Never>>(upstream: numbers.publisher, areInIncreasingOrder: { (a, b) -> Bool in
        print("a is:", a, "b is:", b)
        return a > b
    })

publisher.sink { a in
    print("Value is:", a)
}
