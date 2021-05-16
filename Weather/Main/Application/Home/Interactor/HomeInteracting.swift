protocol HomeInteracting {
    func getCityWeatheronLocation(latitude: String,
                                  longitude: String,
                                  completion: @escaping (WeatherEntityModel?, Error?) -> ())
    func getCityAndDateWeather(cityName: String,
                               date: String,
                               completion: @escaping (WeatherEntityModel?, Error?) -> ())
    func getCityWeather(cityName: String,
                        completion: @escaping (WeatherEntityModel?, Error?) -> ())
}
