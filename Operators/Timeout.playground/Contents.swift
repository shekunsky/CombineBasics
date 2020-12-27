/// When we need to terminate a publisher if an element isn’t delivered within a timeout interval you specify.

import Combine
import Foundation

var WAIT_TIME : Int = 10
var TIMEOUT_TIME : Int = 5 //15

print ("Started at \(Date())")

let subject = PassthroughSubject<String, Never>()
let cancellable = subject
    .timeout(.seconds(TIMEOUT_TIME), scheduler: DispatchQueue.main, options: nil, customError:nil)
    .sink(
        receiveCompletion: { print ("completion: \($0) at \(Date())") },
        receiveValue: { print ("value: \($0) at \(Date())") }
    )

DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(WAIT_TIME),
                              execute: { subject.send("Some data - sent after a delay of \(WAIT_TIME) seconds") } )
