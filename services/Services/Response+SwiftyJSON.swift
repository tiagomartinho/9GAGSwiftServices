import SwiftyJSON

extension Response {
    init(data: NSData?) {
        let data = data ?? NSData()
        let json = JSON(data: data)
        self.init(json: json)
    }

    init(json: JSON) {
        self.items = Item.collection(json["data"]) ?? [Item]()
        self.nextPage = json["paging"]["next"].stringValue
        self.media = json["media"]["mp4"].string
    }
}
