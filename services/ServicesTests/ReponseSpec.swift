@testable import Services
import Quick
import Nimble

class ReponseSpec: QuickSpec {

    override func spec() {
        describe("the client") {
            let client = Client()

            context("when the response is incorrect") {
                beforeEach {
                    Stub.incorrectResponse()
                }
                it("does not have results") {
                    var totalResults: Int?
                    client.get { response in
                        totalResults = response.items.count
                    }
                    expect(totalResults).toEventually(equal(0))
                }
            }

            context("when the response is correct") {
                beforeEach {
                    Stub.correctResponse()
                }
                it("has results") {
                    var totalResults: Int?
                    client.get { response in
                        totalResults = response.items.count
                    }
                    expect(totalResults).toEventually(equal(2))
                }
                it("has an image") {
                    var image: String?
                    client.get { response in
                        image = response.items.first?.image
                    }
                    let expectedImage = "http://img-9gag-fun.9cache.com/photo/aMGWb0G_700b.jpg"
                    expect(image).toEventually(equal(expectedImage))
                }
                it("has a caption") {
                    var caption: String?
                    client.get { response in
                        caption = response.items[1].caption
                    }
                    let expectedCaption = "Albert Stumm tries to win $30,000 answering this"
                    expect(caption).toEventually(equal(expectedCaption))
                }
            }
        }
    }
}
