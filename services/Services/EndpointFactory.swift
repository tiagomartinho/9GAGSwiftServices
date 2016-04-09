class EndpointFactory {
    static let http = "http://"
    static let endpoint = "infinigag.k3min.eu"

    static func build() -> String {
        return http + endpoint
    }
}
