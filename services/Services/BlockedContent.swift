import SwiftyJSON

class BlockedContent {
    static func parse(data: NSData?) -> [String] {
        guard let data = data else { return [String]() }
        let json = JSON(data: data)
        let items = json["Items"]
        return items.map { $1["link"].stringValue }
    }
}
