import SwiftyJSON

extension Response {
    init(data: NSData?) {
        let data = data ?? NSData()
        let json = JSON(data: data)
        self.init(json: json)
    }

    init(json: JSON) {
        self.items = Item.collection(json["items"]) ?? [Item]()
    }
}
