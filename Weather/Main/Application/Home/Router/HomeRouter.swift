import UIKit
class HomeRouter {
    private var viewController: UIViewController
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension HomeRouter: HomeRouting {
    func makeWheatherCardModule(weatherDataModel: WeatherDataModel) -> WeatherComponentView {
        return WeatherCardBuilder().buildWeatherCardModule(weatherDataModel: weatherDataModel)
    }
    
    func makeNoCityModule(noCityModel: NoCityUIModel) -> WeatherComponentView {
        return NoCityBuilder().buildNoCityModule(noCityModel: noCityModel)
    }
    
    func makePopularCitiesModule(popularCitiesDataModel: PopularCitiesDataModel) -> WeatherComponentView {
        return PopularCitiesBuilder()
            .buildPopularCitiesModule(popularCitiesDataModel: popularCitiesDataModel)
    }
    
    func openDatePickerModule(delegate: DatePickerDelegate, cityName: String) {
        viewController.navigationController?.pushViewController(DatePickerBuilder().buildDatePicker(delegate: delegate, cityName: cityName).view, animated: true)
    }
}
