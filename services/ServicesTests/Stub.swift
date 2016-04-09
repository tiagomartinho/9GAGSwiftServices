@testable import Services
import OHHTTPStubs

class Stub {

    static let endpoint = EndpointFactory.endpoint

    class func incorrectResponse() {
        stub(isHost(self.endpoint)) { _ in
            return fixture("", status: 500,
                           headers: ["Content-Type":"application/json"])
        }
    }

    class func correctResponse() {
        stub(isHost(self.endpoint)) { _ in
            let stubPath = OHPathForFile("Response.json", self)
            return fixture(stubPath!, headers: ["Content-Type":"application/json"])
        }
    }
}
