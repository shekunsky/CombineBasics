/// Execute two URLSession requests and wait for their results when they are finished

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

func getUser(urlString: String) -> AnyPublisher<Result<User, Error>, Error> {
    guard let url = URL(string: urlString) else {
        let error = URLError(.badURL, userInfo: [NSURLErrorKey: urlString])
        return  Fail(error: error).eraseToAnyPublisher()
    }
    
    let request = URLRequest(url: url)
    return run(request: request)
}

let user1 = getUser(urlString: "https://www.user.com/1")
let user2 = getUser(urlString: "https://www.user.com/2")
let result = Publishers.Zip(user1, user2)

result.sink { error in
    print("error: \(error)")
} receiveValue: { user1, user2 in
    print(user1, user2)
}
