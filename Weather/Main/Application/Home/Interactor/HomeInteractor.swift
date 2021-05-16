class HomeInteractor {
    private let weatherRepository = WeatherRepository()
}

extension HomeInteractor: HomeInteracting {
    func getCityWeatheronLocation(latitude: String,
                                  longitude: String,
                                  completion: @escaping (WeatherEntityModel?, Error?) -> ()) {
        weatherRepository.getCityWeatherWithLatLong(longitude: longitude,
                                                    latitude: latitude,
                                                    completion: completion)
    }
    
    func getCityAndDateWeather(cityName: String,
                               date: String,
                               completion: @escaping (WeatherEntityModel?, Error?) -> ()) {
        weatherRepository.getCityAndDateWeather(cityName: cityName, date: date, completion: completion)
    }
    
    func getCityWeather(cityName: String,
                        completion: @escaping (WeatherEntityModel?, Error?) -> ()) {
        weatherRepository.getCityWeather(cityName: cityName, completion: completion)
    }
}
