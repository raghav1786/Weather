import Foundation
protocol WeatherServicesProtocol {
    func getWeatherData(urlString: String,
                        completion : @escaping(WeatherEntityModel?,Error?)
                            -> ())
}

class WeatherServices {
}
extension WeatherServices: WeatherServicesProtocol {
    func getWeatherData(urlString: String, completion : @escaping(WeatherEntityModel?,Error?)
                            -> ()) {
        NetworkManager.shared.fetchDataForApi(urlString) { data, error in
            if let error = error {
                completion(nil,error)
            }
            if let result = data as? Data{
                completion(self.parseWeatherData(result),nil)
            }
        }
    }
    
    private func parseWeatherData(_ data: Data) -> WeatherEntityModel? {
        let decoder = JSONDecoder()
        do {
            let weatherData = try decoder.decode(WeatherEntityModel.self, from: data)
            return weatherData
        } catch {
            print("Unable to parse json :\(error)")
            return nil
        }
    }
}
