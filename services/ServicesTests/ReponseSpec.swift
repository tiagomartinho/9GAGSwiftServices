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
                it("to have results") {
                    var totalResults: Int?
                    client.get { response in
                        totalResults = response.items.count
                    }
                    expect(totalResults).toEventually(equal(3))
                }
            }
        }
    }
}
