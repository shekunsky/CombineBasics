/// Execute URLSession request

import Combine
import UIKit

func run<T: Codable>(request: URLRequest) -> AnyPublisher<Result<T, Error>, Error> {
    return URLSession.shared
        .dataTaskPublisher(for: request)
        .tryMap { result -> Result<T, Error> in
            let value = try JSONDecoder().decode(T.self, from: result.data)
            return .success(value)
        }
        .receive(on: DispatchQueue.main)
        .share()
        .eraseToAnyPublisher()
}

struct User: Codable {
    var name: String = ""
    var email: String = ""
}

func getUser() -> AnyPublisher<Result<User, Error>, Error> {
    let url = URL(string: "https://www.example.com")
    let request = URLRequest(url: url!)
    return run(request: request)
}
