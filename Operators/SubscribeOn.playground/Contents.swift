/// When we need to receive elements from an upstream publisher on a specific scheduler.

import Combine
import Foundation

[1, 2, 3]
    .publisher
    .subscribe(on: DispatchQueue(label: "background queue", qos: .background))
    .sink { print ("Stream received: \($0)")}
