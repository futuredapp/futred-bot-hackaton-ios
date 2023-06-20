import Apollo

final class CancellableContinuation<T> {
    var continuation: CheckedContinuation<T, Error>?
    var cancellable: Cancellable?

    func requestWith(
        _ continuation: CheckedContinuation<T, Error>?,
        cancellable: @escaping () -> Cancellable?
    ) {
        self.continuation = continuation
        self.cancellable = cancellable()
    }

    func cancel() {
        continuation?.resume(throwing: ApolloError.requestCancelled)
        cancellable?.cancel()
    }
}
