import Apollo
import ApolloAPI
import Combine
import Foundation

public protocol NetworkingService {
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

final class ProductionNetworkingService: NetworkingService {
    private let apiAdapter: APIAdapter
    private let keychainService: KeychainService

    init(baseUrl: URL, keychainService: KeychainService) {
        self.apiAdapter = ApolloAPIAdapter(
            apollo: ApolloAsyncClient(baseUrl: baseUrl, keychainService: keychainService),
            keychainService: keychainService
        )
        self.keychainService = keychainService
    }

    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        queue: DispatchQueue
    ) async throws -> Query.Data {
        try await apiAdapter.fetch(query: query, cachePolicy: cachePolicy, queue: queue)
    }

    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data {
        try await apiAdapter.perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue)
    }
}

final class MockNetworkingService: NetworkingService {
    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy = .default,
        queue: DispatchQueue = .main
    ) async throws -> Query.Data {
        fatalError("Not implemented!")
    }

    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool = true,
        queue: DispatchQueue = .main
    ) async throws -> Mutation.Data {
        fatalError("Not implemented!")
    }
}
