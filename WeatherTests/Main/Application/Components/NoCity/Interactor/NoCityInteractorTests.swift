import Foundation
import XCTest
@testable import Weather

class NoCityInteractorTests: XCTestCase {
    var interactor: NoCityInteractor?
    override func setUpWithError() throws {
        let dataModel = NoCityUIModel(errorMessage: "api is not working")
        interactor = NoCityInteractor(noCityModel: dataModel)
    }

    override func tearDownWithError() throws {
        interactor = nil
    }

    func testNoCityErrorMessage() throws {
        guard let dataModel = interactor?.getNoCityModule() else { return }
        XCTAssertEqual(dataModel.errorMessage,"api is not working")
        
    }
}
