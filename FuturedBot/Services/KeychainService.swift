import Foundation
import FTPropertyWrappers

protocol KeychainServiceDelegate: AnyObject {
    func credentialsDidReset()
}

protocol KeychainService: AnyObject {
    var credentials: Credentials? { get set }
    var delegate: KeychainServiceDelegate? { get set }

    func reset()
}

final class MockKeychainService: KeychainService {
    var credentials: Credentials?

    weak var delegate: KeychainServiceDelegate?

    func reset() {
        credentials = nil
        delegate?.credentialsDidReset()
    }
}

final class ProductionKeychainService: KeychainService {
    @GenericPassword(service: Keys.credentials.rawValue) private var credentialsStore: Credentials?

    weak var delegate: KeychainServiceDelegate?

    var credentials: Credentials? {
        get {
            credentialsStore
        }
        set {
            credentialsStore = newValue
            if newValue == nil {
                delegate?.credentialsDidReset()
            }
        }
    }

    func reset() {
        credentials = nil
    }

    enum Keys: String {
        case credentials
    }
}
