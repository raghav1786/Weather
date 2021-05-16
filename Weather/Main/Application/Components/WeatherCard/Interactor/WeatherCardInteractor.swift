import Foundation
class WeatherCardInteractor {
    private var weatherDataModel: WeatherDataModel?
    init(weatherDataModel: WeatherDataModel) {
        self.weatherDataModel = weatherDataModel
    }
}

extension WeatherCardInteractor: WeatherCardInteracting {
    func getCityWeatherUpdates() -> WeatherUIModel? {
        guard let model = weatherDataModel else { return nil }
        let weatherModel = model.weather
        let tempModel = weatherModel.main
        let currentDate = model.date ?? Date().formattedDate()
        return WeatherUIModel(cityName: model.weather.name ?? "",
                              cityTemperature: getConvertedTemp(temp: tempModel?.temp ?? 0.0),
                              highTemperature: getConvertedTemp(temp: tempModel?.temp_max ?? 0.0),
                              lowTemperature: getConvertedTemp(temp: tempModel?.temp_min ?? 0.0),
                              date: currentDate,
                              weatherDesc: weatherModel.weather?.first?.desc ?? "",
                              humidity: "Humidity:",
                              pressure: "Pressure:",
                              humidityValue: "\(weatherModel.main?.humidity ?? 0) %",
                              pressureValue: "\(weatherModel.main?.pressure ?? 0) mb")
    }
    private func getConvertedTemp(temp: Double) -> String  {
        // initially temperature comes in kelvin from response. we will change it to celcius.
        return TemperatureConversionUtil.shared.convertTemp(temp: temp, from: .kelvin, to: .celsius)
    }
}
