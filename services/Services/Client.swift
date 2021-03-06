import Foundation

public class Client {

    public weak var delegate: ClientDelegate?

    public typealias ResponseCallback = (Response) -> Void

    private let service: Service
    private let privateEndpoint: String

    private var blockedContent = [String]()

    public init(privateEndpoint: String) {
        self.privateEndpoint = privateEndpoint
        self.service = AlamofireService()
    }

    public func get(section: Section = .Hot, callback: ResponseCallback? = nil) {
        service.get(privateEndpoint) { [weak self] data in
            self?.blockedContent = BlockedContent.parse(data)
            let endpoint = EndpointFactory.build(section)
            self?.service(endpoint, callback: callback)
        }
    }

    public func next(nextPage: String, section: Section = .Hot, callback: ResponseCallback? = nil) {
        let endpoint = EndpointFactory.build(section, nextPage: nextPage)
        service(endpoint, callback: callback)
    }

    private func service(endpoint: String, callback: ResponseCallback?) {
        service.get(endpoint) { [weak self] data in
            if let response = self?.setBlockedContent(Response(data: data)) {
                self?.delegate?.didEndGetWithResponse(response)
                if let callback = callback {
                    callback(response)
                }
            }
        }
    }

    public func flag(item: Item, headers: [String : String]?, uuid: String) {
        let parameters = ["payload": ["Item": ["link": item.image, "uuid": uuid]]]
        service.post(privateEndpoint,
                     parameters: parameters,
                     headers: headers, callback: { data in })
    }

    private func setBlockedContent(response: Response) -> Response {
        let items = response.items.map { item -> Item in
            if blockedContent.contains(item.image) {
                return Item(caption: item.caption,
                    image: item.image,
                    media: item.media,
                    blocked: true)
            }
            return item
            }
        return Response(items: items, nextPage: response.nextPage)
    }
}
