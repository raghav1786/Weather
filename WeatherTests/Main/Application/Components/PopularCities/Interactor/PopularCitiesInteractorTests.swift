import Foundation
import XCTest
@testable import Weather

class PopularCitiesInteractorTests: XCTestCase {
    var interactor: PopularCitiesInteractor?
    override func setUpWithError() throws {
        let dataModel = PopularCitiesDataModel(citySelectedDelegate: nil, selectedCity: "Pune", currentCityName: "Bengaluru")
        interactor = PopularCitiesInteractor(popularCitiesDataModel: dataModel)
    }

    override func tearDownWithError() throws {
        interactor = nil
    }

    func testCurrentCitySuccess() throws {
        guard let dataModel = interactor?.getPopularCitiesDataModel() else { return }
        XCTAssertEqual(dataModel.currentCityName,"Bengaluru")
        
    }
    
    func testSelectedCitySuccess() throws {
        guard let dataModel = interactor?.getPopularCitiesDataModel() else { return }
        XCTAssertEqual(dataModel.selectedCity,"Pune")
        
    }
    func testDelegateIsNil() throws {
        guard let dataModel = interactor?.getPopularCitiesDataModel() else { return }
        XCTAssertNil(dataModel.citySelectedDelegate)
        
    }
}
