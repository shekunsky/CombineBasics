/// Listen to UITextField when text did change

import Combine
import UIKit

extension UITextField {
    func didTextChange(completion: @escaping (String) -> Void) -> AnyCancellable {
        return NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap { notification in
                let textFiled = notification.object as? Self
                let text = textFiled?.text
                return text
            }
            .sink(receiveValue: completion)
    }
}

// How to use it
var bag = Set<AnyCancellable>()
let searchTextField = UITextField()
searchTextField
    .didTextChange {
        print("text value is", $0)
    }.store(in: &bag)
