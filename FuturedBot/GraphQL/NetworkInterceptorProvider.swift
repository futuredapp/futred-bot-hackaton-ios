import Apollo
import ApolloAPI
import Foundation

struct NetworkInterceptorProvider: InterceptorProvider {
    private let client: URLSessionClient
    private let keychainService: KeychainService

    init(client: URLSessionClient, keychainService: KeychainService) {
        self.client = client
        self.keychainService = keychainService
    }

    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        [
            RequestHeaderInterceptor(keychainService: keychainService),
            MaxRetryInterceptor(),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor()
        ]
    }
}

private final class RequestHeaderInterceptor: ApolloInterceptor {
    private let keychainService: KeychainService

    init(keychainService: KeychainService) {
        self.keychainService = keychainService
    }

    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void
    ) {
        request.addHeader(name: "Authorization", value: "Bearer \(keychainService.credentials?.accessToken ?? "")")
        request.addHeader(name: "Accept-Language", value: Locale.current.identifier)

        chain.proceedAsync(request: request, response: response, completion: completion)
    }
}
