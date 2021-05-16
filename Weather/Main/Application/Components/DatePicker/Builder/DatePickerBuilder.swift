class DatePickerBuilder {
    func buildDatePicker(delegate: DatePickerDelegate,
                         cityName: String) -> WeatherComponentView {
        let viewController = DatePickerViewController()
        let interactor = DatePickerInteractor(delegate: delegate,cityName: cityName)
        let presenter = DatePickerPresenter(view: viewController, interactor: interactor)
        viewController.presenter = presenter
        return WeatherComponentView(view: viewController)
    }
}
