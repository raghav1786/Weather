import Foundation
import XCTest
@testable import Weather
struct MockWeatherEntityModel  {
    static func getModel() -> WeatherEntityModel {
        return WeatherEntityModel(name: "CityName",
                                  id: 12,
                                  cod: 123,
                                  coord: Coordinates(lon: 23,
                                                     lat: 21),
                                  weather: [],
                                  main: MockWeatherTemperatureModel.getModel())
    }
}

struct MockWeatherDescModel  {
    static func getModel() -> WeatherDescModel {
        return WeatherDescModel(id: 12,
                                main: "clear",
                                desc: "very clear",
                                icon: "abc1")
    }
}

struct MockWeatherTemperatureModel  {
    static func getModel() -> WeatherTempratureModel {
        return WeatherTempratureModel(temp: 272,
                                      feels_like: 271,
                                      temp_min: 270,
                                      temp_max: 275,
                                      pressure: 1000,
                                      humidity: 70)
    }
}
