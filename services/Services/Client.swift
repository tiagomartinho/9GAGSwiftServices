public class Client {

    public weak var delegate: ClientDelegate?

    public typealias ResponseCallback = (Response) -> Void

    private let service: Service

    public init() {
        self.service = AlamofireService()
    }

    public func get(callback: ResponseCallback? = nil) {
        let endpoint = EndpointFactory.build()
        service(endpoint, callback: callback)
    }

    private func service(endpoint: String, callback: ResponseCallback?) {
        service.get(endpoint) { data in
            let response = Response(data: data)
            self.delegate?.didEndGetWithResponse(response)
            if let callback = callback {
                callback(response)
            }
        }
    }
}
