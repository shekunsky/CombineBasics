/// Performing Key-Value Observing to listen to a property’s value change

import Combine
import UIKit

class User: NSObject {
    @objc dynamic var name: String = ""
    @objc dynamic var email: String = ""
}

var bag = Set<AnyCancellable>()
let user = User()

user.publisher(for: \.name)
    .sink {
        print("User did update name to ", $0)
    }.store(in: &bag)
