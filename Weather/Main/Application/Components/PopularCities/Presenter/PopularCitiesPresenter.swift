import Foundation
class PopularCitiesPresenter {
    private var interactor: PopularCitiesInteracting?
    private weak var view: PopularCitiesViewable?
    private weak var delegate: CitySelectedDelegate?
    var cityList: [City] = CityList.all()
    var userLocationCity: String = ""
    init(view: PopularCitiesViewable,interactor: PopularCitiesInteracting) {
        self.view = view
        self.interactor = interactor
    }
}

extension PopularCitiesPresenter: PopularCitiesPresentable {
    func onViewDidLoad() {
        guard let popularCitiesDataModel =
                self.interactor?.getPopularCitiesDataModel() else { return }
        delegate = popularCitiesDataModel.citySelectedDelegate
        if !popularCitiesDataModel.currentCityName.isEmpty {
            userLocationCity = popularCitiesDataModel.currentCityName
            insertCurrentLocatedCityInList(currentCity: popularCitiesDataModel.currentCityName)
        }
        removeSelectedCityFromCityList(selectedCity: popularCitiesDataModel.selectedCity)
        self.view?.setData()
    }
    
    func getWeatherForSelectedCity(cityName: String) {
        delegate?.onCitySelected(cityName: cityName)
    }
    
    private func insertCurrentLocatedCityInList(currentCity: String) {
        cityList.insert(City(name: currentCity, id: UUID()), at: 0)
    }
    
    private func removeSelectedCityFromCityList(selectedCity: String) {
        _ = cityList.map {
            if $0.name == selectedCity,
               let index = cityList.firstIndex(of: $0) {
                cityList.remove(at: index)
            }
        }
    }
}
