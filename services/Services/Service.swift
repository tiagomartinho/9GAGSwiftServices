import Foundation

protocol Service {
    func get(url: String, callback: NSData? -> Void)
    func post(url: String, parameters: [String: AnyObject]?,
              headers: [String: String]?, callback: NSData? -> Void)
}
