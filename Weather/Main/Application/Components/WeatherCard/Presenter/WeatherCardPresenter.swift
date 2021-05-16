import Foundation
class WeatherCardPresenter {
    weak private var view: WeatherCardViewable?
    private var interactor: WeatherCardInteracting?
    private var isCelsiusSelected: Bool = true
    init(view: WeatherCardViewable, interactor: WeatherCardInteracting) {
        self.view = view
        self.interactor = interactor
    }
}

extension WeatherCardPresenter: WeatherCardPresentable {
    func onViewDidLoad() {
        guard let weatherModel = self.interactor?.getCityWeatherUpdates() else {return}
        self.view?.setData(model: weatherModel)
    }
}


//Temperature Conversion from Celsius to Fahrenheit.
extension WeatherCardPresenter {
    func convertTemperatureUnits(viewModel: WeatherTemperatureViewModel) {
        isCelsiusSelected = !isCelsiusSelected
        if isCelsiusSelected {
            setConvertedTempModel(viewModel: viewModel,
                                  from: .fahrenheit,
                                  to: .celsius)
        } else {
            setConvertedTempModel(viewModel: viewModel,
                                  from: .celsius,
                                  to: .fahrenheit)
        }
    }
    private func setConvertedTempModel(viewModel: WeatherTemperatureViewModel, from: UnitTemperature, to: UnitTemperature) {
        let temp = getConvertedTemp(temp: viewModel.temp,from: from, to: to)
        let maxTemp = getConvertedTemp(temp: viewModel.maxTemp,from: from, to: to)
        let minTemp = getConvertedTemp(temp: viewModel.minTemp,from: from, to: to)
        let uiModel = WeatherTemperatureUIModel(temp: temp, maxTemp: maxTemp, minTemp: minTemp)
        self.view?.setTemperatureData(model: uiModel)
    }
    
    private func getConvertedTemp(temp: Double, from: UnitTemperature, to: UnitTemperature) -> String {
        return TemperatureConversionUtil.shared.convertTemp(temp: temp, from: from, to: to)
    }
}
