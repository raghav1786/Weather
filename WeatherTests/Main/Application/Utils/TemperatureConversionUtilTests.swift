import Foundation
import XCTest
@testable import Weather

class TemperatureConversionUtilTests: XCTestCase {
    var tempUtil: TemperatureConversionUtil?
    override func setUpWithError() throws {
        tempUtil = TemperatureConversionUtil.shared
    }

    override func tearDownWithError() throws {
        tempUtil = nil
    }

    func testConvertKelvinToCelsiusSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 273.0, from: .kelvin, to: .celsius)
        XCTAssertEqual(temp,"-0°C")
        
    }
    
    func testConvertCelsiusToKelvinSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 0, from: .celsius, to: .kelvin)
        XCTAssertEqual(temp,"273 K")
        
    }
    func testConvertCelsiusToFarenhietSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 0, from: .celsius, to: .fahrenheit)
        XCTAssertEqual(temp,"32°F")
        
    }
    
    func testConvertFarenhietToCelsiusToSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 32, from: .fahrenheit, to: .celsius)
        XCTAssertEqual(temp,"0°C")
        
    }
    
    func testConvertKelvinToFarenhietSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 273.0, from: .kelvin, to: .fahrenheit)
        XCTAssertEqual(temp,"32°F")
        
    }
    
    func testConvertFarenhietToKelvinSuccess() throws {
        guard let tempUtil = self.tempUtil else { return }
        let temp = tempUtil.convertTemp(temp: 32, from: .fahrenheit, to: .kelvin)
        XCTAssertEqual(temp,"273 K")
        
    }
}
