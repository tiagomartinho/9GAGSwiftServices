class EndpointFactory {
    static let http = "http://"
    static let endpoint = "infinigag.k3min.eu"
    static let hot = "/hot"

    static func build() -> String {
        return http + endpoint + hot
    }

    static func build(nextPage: String) -> String {
        return http + endpoint + hot + "/" + nextPage
    }
}
