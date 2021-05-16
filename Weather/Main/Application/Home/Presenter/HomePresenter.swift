import CoreLocation
class HomePresenter {
    private weak var view: HomeViewable?
    private var router: HomeRouting?
    private var interactor: HomeInteracting?
    private var currentCity: String = ""
    private var selectedCity: String = ""
    private var components: [WeatherComponentView] = []
    
    var userLocation: CLLocation? = nil {
        didSet {
            getCityNameForLocation { [weak self] currentCityName in
                guard let strongSelf = self else {return}
                strongSelf.currentCity = currentCityName
            }
        }
    }
    init(view: HomeViewable, router: HomeRouting, interactor: HomeInteracting) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
}

extension HomePresenter: HomePresentable {
    func onViewDidLoad() {
        self.view?.display(components.compactMap { $0.view })
    }
    
    func getCityWeatherOnLocation(location: CLLocation) {
        let latitude = "\(location.coordinate.latitude)"
        let longitude = "\(location.coordinate.longitude)"
        DispatchQueue.global().async {
            self.interactor?.getCityWeatheronLocation(latitude: latitude,
                                                      longitude: longitude) { [weak self] result,error in
                guard let strongSelf = self else { return }
                guard let result = result else {
                    strongSelf.addNoCityComponent(type: .apiFailure)
                    return
                }
                strongSelf.addWeatherCardComponents(result: result)
            }
        }
    }
    
    func onDatePicker() {
        let  city = self.selectedCity.isEmpty ? currentCity: self.selectedCity
        self.router?.openDatePickerModule(delegate: self, cityName: city)
    }
    
    func addNoCityComponent(type: NoCity.NoCityUseCase) {
        DispatchQueue.main.async {[weak self] in
            guard let strongSelf = self else { return }
            ActivityIndicator.shared.stopAnimation()
            ActivityIndicator.shared.removeActivityIndicator()
            strongSelf.components = []
            let noCityModel = NoCity().getNoCityDataModel(type: type)
            guard let cityWeatherModule = strongSelf.router?.makeNoCityModule(noCityModel: noCityModel) else {return }
            strongSelf.components.append(cityWeatherModule)
            strongSelf.addPopularCitiesComponents()
            strongSelf.view?.display(strongSelf.components.compactMap { $0.view })
        }
    }
}


extension HomePresenter: DatePickerDelegate {
    func onSelectedDate(date: Date) {
        let  cityName = self.selectedCity.isEmpty ? currentCity: self.selectedCity
        let dateString = date.formattedDate()
        if let view = self.view?.view {
            ActivityIndicator.shared.addActivityIndicator(view)
        }
        DispatchQueue.global().async {
            self.interactor?.getCityAndDateWeather(cityName: cityName,
                                                   date: dateString) { [weak self] result,error in
                guard let strongSelf = self else { return }
                guard let result = result else {
                    strongSelf.addNoCityComponent(type: .apiFailure)
                    return
                }
                strongSelf.addWeatherCardComponents(result: result,date: dateString)
            }
        }
    }
}

extension HomePresenter: CitySelectedDelegate {
    func onCitySelected(cityName: String) {
        selectedCity = cityName
        if let view = self.view?.view {
            ActivityIndicator.shared.addActivityIndicator(view)
        }
        DispatchQueue.global().async {
            self.interactor?.getCityWeather(cityName: cityName) { [weak self] result,error in
                guard let strongSelf = self else { return }
                guard let result = result else {
                    strongSelf.addNoCityComponent(type: .apiFailure)
                    return
                }
                strongSelf.addWeatherCardComponents(result: result)
            }
        }
    }
}


// Popular Cities Component
extension HomePresenter {
    private func addPopularCitiesComponents(selectedCity: String = "") {
        let popularCitiesDataModel = PopularCitiesDataModel(citySelectedDelegate: self, selectedCity: selectedCity, currentCityName: currentCity)
        guard let popularCitiesComponent =
                self.router?.makePopularCitiesModule(popularCitiesDataModel: popularCitiesDataModel) else { return }
        self.components.append(popularCitiesComponent)
    }
}
// Weather Card Component
extension HomePresenter {
    private func addWeatherCardComponents(result: WeatherEntityModel,date: String? = nil) {
        DispatchQueue.main.async {[weak self] in
            guard let strongSelf = self else { return }
            ActivityIndicator.shared.stopAnimation()
            ActivityIndicator.shared.removeActivityIndicator()
            strongSelf.components = []
            guard let cityWeatherModule = strongSelf.router?.makeWheatherCardModule(weatherDataModel: WeatherDataModel(weather: result, date: date)) else {return }
            strongSelf.components.append(cityWeatherModule)
            strongSelf.addPopularCitiesComponents(selectedCity: result.name ?? "")
            strongSelf.view?.display(strongSelf.components.compactMap { $0.view })
        }
    }
}

// Reverse Geocoding
extension HomePresenter {
    private func getCityNameForLocation(completion: @escaping(String) -> ()) {
        if let location = userLocation {
            location.fetchCityAndCountry {city, country, error in
                completion("\(city ?? "")")
            }
        }
    }
}
