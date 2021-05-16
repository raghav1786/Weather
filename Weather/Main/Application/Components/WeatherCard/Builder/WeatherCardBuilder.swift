public class WeatherCardBuilder {
    func buildWeatherCardModule(weatherDataModel: WeatherDataModel) -> WeatherComponentView {
        let viewController = WeatherCardViewController()
        let interactor = WeatherCardInteractor(weatherDataModel: weatherDataModel)
        let presenter = WeatherCardPresenter(view: viewController,interactor: interactor)
        viewController.presenter = presenter
        return WeatherComponentView(view: viewController)
    }
}
