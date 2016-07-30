public struct Item {
    public let caption: String
    public let image: String
    public let media: String?
    public var blocked = false

    public init(caption: String, image: String, media: String) {
        self.caption = caption
        self.image = image
        self.media = media
    }
}
