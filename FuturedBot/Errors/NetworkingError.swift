import Apollo
import Foundation

enum NetworkingError: LocalizedError {
    case http(error: StandardError)
    case unauthorized(error: StandardError)
    case unknown(code: Int? = nil, error: Error? = nil)
    case connection(Error)
    case decoding(Error)

    init(error: Error) {
        if let error = error as? NetworkingError {
            self = error
        } else if let error = error as? ApolloError {
            self = NetworkingError(apolloError: error)
        } else if let error = error as? URLSessionClient.URLSessionClientError,
                  case let URLSessionClient.URLSessionClientError.networkError(_, _, underlyingError) = error {
            self = .connection(underlyingError)
        } else {
            self = .unknown(error: error)
        }
    }

    init(apolloError: ApolloError) {
        if case let ApolloError.graphQLErrors(graphQLErrors) = apolloError,
           let graphQLError = graphQLErrors.first,
           let errorMessage = graphQLError.message,
           let errorCode = graphQLError.extensions?["code"] as? String {
            let exception = graphQLError.extensions?["exception"] as? [String: Any]
            let exceptionStatus = exception?["status"] as? Int
            let response = graphQLError.extensions?["response"] as? [String: Any]
            let responseStatus = response?["statusCode"] as? Int
            if exceptionStatus == 401 || responseStatus == 401 {
                self = .unauthorized(
                    error: StandardError(
                        message: errorMessage,
                        errorCode: errorCode
                    )
                )
            } else {
                self = .http(
                    error: StandardError(
                        message: errorMessage,
                        errorCode: errorCode
                    )
                )
            }
        } else {
            self = .unknown(error: apolloError)
        }
    }

    var errorDescription: String? {
        switch self {
        case .http(let error):
            return error.message
        case .unauthorized(let error):
            return error.message
        case .unknown(_, let error):
            return error?.localizedDescription ?? "Ouha něco se polámalo"
        case .connection(let error):
            return error.localizedDescription
        case .decoding(let error):
            return error.localizedDescription
        }
    }
}
