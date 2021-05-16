import CoreLocation
protocol HomePresentable {
    var userLocation: CLLocation? { get set }
    func onViewDidLoad()
    func addNoCityComponent(type: NoCity.NoCityUseCase)
    func onDatePicker()
    func getCityWeatherOnLocation(location: CLLocation)
}
