import Foundation
import XCTest
@testable import Weather

class DateExtensionTests: XCTestCase {
    var date: Date?
    override func setUpWithError() throws {
        var dateComponents = DateComponents()
        dateComponents.year = 2021
        dateComponents.month = 5
        dateComponents.day = 1
        let userCalendar = Calendar(identifier: .gregorian)
        guard let date = userCalendar.date(from: dateComponents) else { return }
        self.date = date
    }

    override func tearDownWithError() throws {
        date = nil
    }

    func testformattedDate() throws {
        guard let date = self.date else { return }
        XCTAssertEqual(date.formattedDate(), "May 01,2021")
        
    }
    
    func testIsDatePrimeSuccess() throws {
        guard let date = self.date else { return }
        XCTAssertTrue(date.isDatePrime())
        
    }
    
    func testIsDatePrimeError() throws {
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 2021
        dateComponents.month = 5
        dateComponents.day = 14
        let userCalendar = Calendar(identifier: .gregorian)
        guard let date = userCalendar.date(from: dateComponents) else { return }
        XCTAssertFalse(date.isDatePrime())
        
    }
    
    func testIsDatePrimeClosure() throws {
        // Specify date components
        var dateComponents = DateComponents()
        dateComponents.year = 232322
        dateComponents.month = 4323432
        dateComponents.day = 2121212
        let userCalendar = Calendar(identifier: .gregorian)
        guard let date = userCalendar.date(from: dateComponents) else { return }
        XCTAssertFalse(date.isDatePrime())
        
    }
}
