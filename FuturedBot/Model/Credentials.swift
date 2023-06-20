import Foundation

struct Credentials: Codable {
    let accessToken: String
    let refreshToken: String
}

extension Credentials {
    init(data: LoginMutation.Data) {
        accessToken = data.loginWithGoogle.accessToken
        refreshToken = data.loginWithGoogle.refreshToken
    }
}
