import Foundation
import XCTest
@testable import Weather

class DatePickerInteractorTests: XCTestCase {
    var interactor: DatePickerInteractor?
    override func setUpWithError() throws {
        interactor = DatePickerInteractor(delegate: nil, cityName: "Pune")
    }

    override func tearDownWithError() throws {
        interactor = nil
    }

    func testCurrentCitySuccess() throws {
        guard let dataModel = interactor?.getDatePickerModelData() else { return }
        XCTAssertEqual(dataModel.cityNameValue,"Pune")
        
    }
    
    func testCurrentCityLabelName() throws {
        guard let dataModel = interactor?.getDatePickerModelData() else { return }
        XCTAssertEqual(dataModel.currentCityLabel,"current city:")
        
    }
    
    func testDelegateIsNil() throws {
        guard let dataModel = interactor?.getDatePickerModelData() else { return }
        XCTAssertNil(dataModel.delegate)
        
    }
}
