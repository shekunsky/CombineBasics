/// Check if the device orientation is portrait

import Combine
import UIKit

extension UIDevice {
    class func isPortrait(completion: @escaping (Bool) -> Void) -> AnyCancellable {
        return NotificationCenter.default
            .publisher(for: Self.orientationDidChangeNotification)
            .map { _ in Self.current.orientation == .portrait }
            .sink(receiveValue: completion)
    }
}

// How to use it
var bag = Set<AnyCancellable>()

UIDevice.isPortrait {
    print("isPortrait", $0)
}.store(in: &bag)
