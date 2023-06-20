import Foundation
import UIKit.UIApplication

extension URL {
    init(urlString value: String) {
        guard let url = URL(string: "\(value)") else {
            fatalError("\(value) is not valid URL!")
        }
        self = url
    }
}
