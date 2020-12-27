/// Execute network request when user types any text on UITextField

import Combine
import UIKit

var bag = Set<AnyCancellable>()
let searchTextField = UITextField()

class API {
    func search(with query: String) -> PassthroughSubject<String,Never> {
        PassthroughSubject<String, Never>()
    }
}

NotificationCenter.default
    .publisher(for: UITextField.textDidChangeNotification, object: searchTextField)
    .debounce(for: 0.5, scheduler: DispatchQueue.main)
    .compactMap { notification -> String? in
        let textFiled = notification.object as? UITextField
        let text = textFiled?.text
        return text
    }
    .removeDuplicates()
    .flatMap(maxPublishers: .max(1)) { query in
        return API().search(with: query)
            .eraseToAnyPublisher()
    }
    .receive(on: DispatchQueue.main)
    .eraseToAnyPublisher()
    .sink {
        print("downloaded value is", $0)
    }
    .store(in: &bag)
