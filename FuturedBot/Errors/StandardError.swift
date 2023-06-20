import Foundation

struct StandardError: Error, Decodable {
    let message: String
    let errorCode: Code?

    init(message: String, errorCode: String?) {
        self.message = message
        self.errorCode = errorCode.flatMap { Code(rawValue: $0) }
    }
}

extension StandardError {
    enum Code: String, Decodable {
        case internalError = "INTERNAL_ERROR"
    }
}
