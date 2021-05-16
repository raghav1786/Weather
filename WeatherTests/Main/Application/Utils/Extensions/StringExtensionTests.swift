import Foundation
import XCTest
@testable import Weather

class StringExtensionTests: XCTestCase {
    var testString: String?
    override func setUpWithError() throws {
        testString = "234r4sdsd2368nbnb2sdsdsd"
    }

    override func tearDownWithError() throws {
        testString = nil
    }

    func testRemoveNonNumericSuccess() throws {
        guard let str = self.testString else { return }
        XCTAssertEqual(str.doubleFormat() ?? 0.0,234423682.0)
        
    }
    
    func testRemoveNonNumericFailure() throws {
        XCTAssertEqual("adsdsdsds".doubleFormat() ?? 0.0, 0.0)
        
    }
}
