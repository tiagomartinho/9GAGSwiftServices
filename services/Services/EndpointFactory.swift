class EndpointFactory {
    static let https = "https://"
    static let endpoint = "endpoint.something"

    static func build() -> String {
        return https + endpoint
    }
}
