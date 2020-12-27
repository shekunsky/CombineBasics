/// Ask the user for the notification permission

import Combine
import UIKit

func requestNotificationAuthorization(promise: @escaping Future<Bool, Error>.Promise) {
    let options: UNAuthorizationOptions = [.sound, .alert, .badge]
    UNUserNotificationCenter.current().requestAuthorization(options: options) { isGranted, error in
        if let error = error {
            promise(.failure(error))
        } else {
            promise(.success(isGranted))
        }
    }
}

func notificationAuthorization(isGranted: Bool) {
    print("isGranted", isGranted)
}

var bag = Set<AnyCancellable>()
let notificationFuture = Future<Bool, Error>(requestNotificationAuthorization)

notificationFuture
    .map { $0 }
    .catch { _ in Just(false) }
    .sink(receiveValue: notificationAuthorization)
    .store(in: &bag)
