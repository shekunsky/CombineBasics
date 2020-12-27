/// When we need to publish elements only after a specified time interval elapses between events.

import Combine
import Foundation

let subject1 = PassthroughSubject<String, Never>()
let queue = DispatchQueue(label: "queue", qos: .background)
print("Time now is: ",Date())
subject1
    .debounce(for: .seconds(2), scheduler: queue)
    .sink {
        print("value is: ", $0, "at time: ", Date())
    }

subject1.send("A")
subject1.send("AA")

pause()
