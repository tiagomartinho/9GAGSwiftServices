import SwiftyJSON

extension Item {
    init(json: JSON) {
        self.uuid = json["uuid"].stringValue
        self.name = json["name"].stringValue
    }
}

extension Item {
    static func collection(json: JSON) -> [Item] {
        return json.map { Item(json: $1) }
    }
}
