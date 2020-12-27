/// Credentials validation to enable login button

import Combine
import UIKit

class SomeClass {
    func isValidCredentials(username: String, password: String) -> Bool {
        return username.count >= 6 && password.count >= 6
    }
    
    @Published private var username: String = ""
    @Published private var password: String = ""
    
    var bag = Set<AnyCancellable>()
    let loginButton = UIButton()
    
    func setup() {
        let credentials = Publishers
            .CombineLatest($username, $password)
            .share()
        
        credentials
            .map(isValidCredentials)
            .assign(to: \.isEnabled, on: loginButton)
            .store(in: &bag)
    }
}
