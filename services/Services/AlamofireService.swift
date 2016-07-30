import Alamofire

class AlamofireService: Service {
    func get(url: String, callback: NSData? -> Void) {
        Alamofire.request(.GET, url)
            .validate()
            .responseJSON { callback($0.data) }
    }

    func post(url: String,
              parameters: [String: AnyObject]?,
              headers: [String: String]?,
              callback: NSData? -> Void) {
        Alamofire.request(.POST, url,
                          parameters: parameters,
                          encoding: .JSON,
                          headers: headers)
            .validate()
    }
}
