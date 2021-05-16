class WeatherRepository {
    let weatherServices = WeatherServices()
    func getCityWeather(cityName: String,
                        completion : @escaping(WeatherEntityModel?,Error?) -> ()) {
        let searchCityWeatherURL = Constants.baseURL + "&q=\(cityName)"
        weatherServices.getWeatherData(urlString: searchCityWeatherURL, completion: completion)
    }
    
    func getCityAndDateWeather(cityName: String,
                               date: String,
                               completion : @escaping(WeatherEntityModel?,Error?) -> ()) {
        let searchCityAndDateWeatherURL = Constants.baseURL + "&q=\(cityName)"
        weatherServices.getWeatherData(urlString: searchCityAndDateWeatherURL,
                           completion: completion)
    }
    
    func getCityWeatherWithLatLong(longitude: String,
                                   latitude: String,
                                   completion : @escaping(WeatherEntityModel?,Error?) -> ()) {
        let cityWeatherLatLongURL = Constants.baseURL + "&lat=\(latitude)" + "&lon=\(longitude)"
        weatherServices.getWeatherData(urlString: cityWeatherLatLongURL,
                           completion: completion)
    }
}
