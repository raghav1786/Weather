protocol PopularCitiesPresentable {
    var userLocationCity: String {get set}
    var cityList: [City] {get}
    func getWeatherForSelectedCity(cityName: String)
    func onViewDidLoad()
}
