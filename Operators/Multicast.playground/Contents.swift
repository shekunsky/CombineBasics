/// When we need to use a subject to deliver elements to multiple subscribers.
/// It returns a ConnectablePublisher which publishing only begins after a call to connect().

import Combine
import Foundation

let pub = ["First", "Second", "Third"]
    .publisher
    .multicast { PassthroughSubject<String, Never>() }

let cancellable1 = pub
    .sink { print ("Stream 1 received: \($0)")}
let cancellable2 = pub
    .sink { print ("Stream 2 received: \($0)")}

pub.connect()
