import Apollo
import ApolloAPI
import Combine
import Foundation

protocol ApolloAsyncClientProtocol {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        queue: DispatchQueue
    ) async throws -> Query.Data

    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data
}

struct ApolloAsyncClient: ApolloAsyncClientProtocol {
    private let client: ApolloClientProtocol

    private init(client: ApolloClientProtocol) {
        self.client = client
    }

    init(baseUrl: URL, keychainService: KeychainService) {
        let client = URLSessionClient(sessionConfiguration: {
            let config = URLSessionConfiguration.default
            config.timeoutIntervalForRequest = 5
            return config
        }())

        let provider = NetworkInterceptorProvider(client: client, keychainService: keychainService)
        let requestChainNetworkTransport = RequestChainNetworkTransport(
            interceptorProvider: provider,
            endpointURL: baseUrl
        )

        let apolloClient = ApolloClient(networkTransport: requestChainNetworkTransport, store: ApolloStore())
        self.init(client: apolloClient)
    }

    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        queue: DispatchQueue
    ) async throws -> Query.Data {
        let cancellable = CancellableContinuation<Query.Data>()

        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                cancellable.requestWith(continuation) {
                    self.client.fetch(query: query, cachePolicy: cachePolicy, contextIdentifier: nil, queue: queue) { result in
                        switch result {
                        case .success(let parameter):
                            if let errors = parameter.errors {
                                continuation.resume(throwing: ApolloError.graphQLErrors(errors))
                            } else if let data = parameter.data {
                                continuation.resume(returning: data)
                            } else {
                                assertionFailure("No data as well as no error received")
                                continuation.resume(throwing: NetworkingError.unknown())
                            }
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        } onCancel: {
            cancellable.cancel()
        }
    }

    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data {
        let cancellable = CancellableContinuation<Mutation.Data>()

        return try await withTaskCancellationHandler {
            try await withCheckedThrowingContinuation { continuation in
                cancellable.requestWith(continuation) {
                    self.client.perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue) { result in
                        switch result {
                        case .success(let parameter):
                            if let errors = parameter.errors {
                                continuation.resume(throwing: ApolloError.graphQLErrors(errors))
                            } else if let data = parameter.data {
                                continuation.resume(returning: data)
                            } else {
                                assertionFailure("No data as well as no error received")
                                continuation.resume(throwing: NetworkingError.unknown())
                            }
                        case .failure(let error):
                            continuation.resume(throwing: error)
                        }
                    }
                }
            }
        } onCancel: {
            cancellable.cancel()
        }
    }
}
