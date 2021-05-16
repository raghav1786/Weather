import Foundation
import XCTest
@testable import Weather

class IntExtensionsTests: XCTestCase {
    var number: Int?
    override func setUpWithError() throws {
        number = 7
    }

    override func tearDownWithError() throws {
        number = nil
    }

    func testisPrimeSuccess() throws {
        guard let number = self.number else { return }
        XCTAssertTrue(number.isPrime)
        
    }
    
    func testisPrimeFailure() throws {
        XCTAssertFalse(9.isPrime)
        
    }
}
