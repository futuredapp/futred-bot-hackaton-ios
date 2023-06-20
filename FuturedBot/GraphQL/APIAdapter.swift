import Apollo
import ApolloAPI
import Combine
import Foundation

protocol APIAdapter: AnyObject {
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

final class ApolloAPIAdapter: APIAdapter {
    private let apollo: ApolloAsyncClientProtocol
    private let keychainService: KeychainService

    init(apollo: ApolloAsyncClientProtocol, keychainService: KeychainService) {
        self.apollo = apollo
        self.keychainService = keychainService
    }

    func fetch<Query: GraphQLQuery>(
        query: Query,
        cachePolicy: CachePolicy,
        queue: DispatchQueue
    ) async throws -> Query.Data {
        do {
            return try await apollo.fetch(query: query, cachePolicy: cachePolicy, queue: queue)
        } catch {
            try await refreshTokenIfNeeded(error)
            return try await apollo.fetch(query: query, cachePolicy: cachePolicy, queue: queue)
        }
    }

    func perform<Mutation: GraphQLMutation>(
        mutation: Mutation,
        publishResultToStore: Bool,
        queue: DispatchQueue
    ) async throws -> Mutation.Data {
        do {
            return try await apollo.perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue)
        } catch {
            try await refreshTokenIfNeeded(error)
            return try await apollo.perform(mutation: mutation, publishResultToStore: publishResultToStore, queue: queue)
        }
    }

    private func refreshTokenIfNeeded(_ error: Error) async throws {
        guard case .unauthorized = NetworkingError(error: error) else {
            throw error
        }

        guard let refreshToken = keychainService.credentials?.refreshToken else {
            keychainService.credentials = nil
            throw NetworkingError.unauthorized(error: StandardError(message: "Ouha něco se polámalo", errorCode: nil))
        }

        do {
            let data = try await apollo.perform(mutation: RefreshTokenMutation(refreshToken: refreshToken), publishResultToStore: false, queue: .main)
            keychainService.credentials = Credentials(accessToken: data.refreshToken.accessToken, refreshToken: refreshToken)
        } catch {
            keychainService.credentials = nil
            throw error
        }
    }
}
