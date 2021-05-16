class NoCityBuilder {
    func buildNoCityModule(noCityModel: NoCityUIModel) -> WeatherComponentView {
        let viewController = NoCityViewController()
        let interactor = NoCityInteractor(noCityModel: noCityModel)
        let presenter = NoCityPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return WeatherComponentView(view: viewController)
    }
}
