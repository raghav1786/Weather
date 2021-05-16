class PopularCitiesBuilder {
    func buildPopularCitiesModule(popularCitiesDataModel:
                                    PopularCitiesDataModel) -> WeatherComponentView {
        let viewController = PopularCitiesViewController()
        let interactor = PopularCitiesInteractor(popularCitiesDataModel: popularCitiesDataModel)
        let presenter = PopularCitiesPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return WeatherComponentView(view: viewController)
    }
}
