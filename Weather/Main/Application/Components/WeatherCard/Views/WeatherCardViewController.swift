import UIKit
class WeatherCardViewController: UIViewController {
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityTemperatureButton: UIButton!
    @IBOutlet private weak var highTemperatureButton: UIButton!
    @IBOutlet private weak var lowTemperatureButton: UIButton!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var weatherDescLabl: UILabel!
    @IBOutlet private weak var humidityLabel: UILabel!
    @IBOutlet private weak var pressureLabel: UILabel!
    @IBOutlet private weak var humidityTitleLabel: UILabel!
    @IBOutlet private weak var pressureTitleLabel: UILabel!
    
    var presenter: WeatherCardPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    private func setFonts() {
        cityNameLabel.font = .heading()
        cityTemperatureButton.titleLabel?.font = .bigHeading()
        highTemperatureButton.titleLabel?.font = .desc()
        lowTemperatureButton.titleLabel?.font = .desc()
        dateLabel.font = .desc()
        weatherDescLabl.font = .title()
        humidityLabel.font = .desc()
        pressureLabel.font = .desc()
        humidityTitleLabel.font = .desc()
        pressureTitleLabel.font = .desc()
    }
    
    @IBAction private func unitsClicked(_ sender: Any) {
        if let temp = cityTemperatureButton.titleLabel?.text?.doubleFormat(),
           let temp_max = highTemperatureButton.titleLabel?.text?.doubleFormat(),
           let temp_min = lowTemperatureButton.titleLabel?.text?.doubleFormat() {
            let viewModel = WeatherTemperatureViewModel(temp: temp, maxTemp: temp_max, minTemp: temp_min)
            presenter?.convertTemperatureUnits(viewModel: viewModel)
        }
    }
}

extension WeatherCardViewController: WeatherCardViewable {
    func setData(model: WeatherUIModel) {
        setFonts()
        cityNameLabel.text = model.cityName
        cityTemperatureButton.setTitle(model.cityTemperature, for: .normal)
        highTemperatureButton.setTitle(model.highTemperature, for: .normal)
        lowTemperatureButton.setTitle(model.lowTemperature, for: .normal)
        dateLabel.text = model.date
        weatherDescLabl.text = model.weatherDesc
        humidityLabel.text = model.humidityValue
        pressureLabel.text = model.pressureValue
        pressureTitleLabel.text = model.pressure
        humidityTitleLabel.text = model.humidity
    }
    
    func setTemperatureData(model: WeatherTemperatureUIModel) {
        cityTemperatureButton.setTitle(model.temp, for: .normal)
        highTemperatureButton.setTitle(model.maxTemp, for: .normal)
        lowTemperatureButton.setTitle(model.minTemp, for: .normal)
    }
}
