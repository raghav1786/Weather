import Foundation
import XCTest
@testable import Weather

class WeatherCardInteractorTests: XCTestCase {
    var interactor: WeatherCardInteractor?
    override func setUpWithError() throws {
        let entityModel = MockWeatherEntityModel.getModel()
        let dateString = "May 14,2021"
        let dataModel = WeatherDataModel(weather: entityModel, date: dateString)
        interactor = WeatherCardInteractor(weatherDataModel: dataModel)
    }

    override func tearDownWithError() throws {
        interactor = nil
    }

    func testNoCityErrorMessage() throws {
        guard let dataModel = interactor?.getCityWeatherUpdates()  else { return }
        XCTAssertEqual(dataModel.cityTemperature,"-1°C")
        XCTAssertEqual(dataModel.lowTemperature,"-3°C")
        XCTAssertEqual(dataModel.highTemperature,"2°C")
        XCTAssertEqual(dataModel.humidityValue,"70 %")
        XCTAssertEqual(dataModel.pressureValue,"1000 mb")
        XCTAssertEqual(dataModel.weatherDesc,"")
        XCTAssertEqual(dataModel.pressure,"Pressure:")
        XCTAssertEqual(dataModel.humidity,"Humidity:")
        XCTAssertEqual(dataModel.cityName,"CityName")
        XCTAssertEqual(dataModel.date,"May 14,2021")
        
    }
}
