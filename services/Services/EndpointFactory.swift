class EndpointFactory {
    static let http = "http://"
    static let endpoint = "infinigag.k3min.eu"
    static let hot = "/hot"

    static func build() -> String {
        return http + endpoint + hot
    }

    static func build(response: Response) -> String {
        return http + endpoint + hot + "/" + response.nextPage
    }
}
