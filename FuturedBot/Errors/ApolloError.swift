import Apollo

enum ApolloError: Error {
    case graphQLErrors([GraphQLError])
    case requestCancelled
}
