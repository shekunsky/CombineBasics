/// When we need to share the output of an upstream publisher with multiple subscribers.

import Combine
import Foundation

let pub = (1...3).publisher
    .delay(for: 1, scheduler: DispatchQueue.main)
    .map( { _ in return Int.random(in: 0...100) } )
    .print("Random")
    .share()

let cancellable1 = pub
    .sink { print ("Stream 1 received: \($0)")}
let cancellable2 = pub
    .sink { print ("Stream 2 received: \($0)")}
