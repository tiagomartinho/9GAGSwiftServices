import SwiftyJSON

extension Item {
    init(json: JSON) {
        self.caption = json["caption"].stringValue
        self.image = json["images"]["large"].stringValue
    }
}

extension Item {
    static func collection(json: JSON) -> [Item] {
        return json.map { Item(json: $1) }
    }
}
