class EndpointFactory {

    static let http = "http://"
    static let endpoint = "infinigag.k3min.eu"

    static func build(section: Section) -> String {
        return http + endpoint + section.rawValue
    }

    static func build(section: Section, nextPage: String) -> String {
        return build(section) + "/" + nextPage
    }
}
