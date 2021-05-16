import UIKit
import CoreLocation

class HomeViewController: UIViewController {
    @IBOutlet private weak var stackView: UIStackView!
    private lazy var locationManager = CLLocationManager()
    
    var presenter: HomePresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addRightBarButtonItems()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        checkLocationServicesStatus()
        presenter?.onViewDidLoad()
    }
}

extension HomeViewController: HomeViewable {
    func display(_ controllers: [UIViewController]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        controllers.forEach { controller in
            stackView.addArrangedSubview(controller.view)
            controller.willMove(toParent: self)
            addChild(controller)
            controller.didMove(toParent: self)
            controller.view.translatesAutoresizingMaskIntoConstraints = false
        }
    }
}

// Handle bar button items.
extension HomeViewController {
    private func addRightBarButtonItems() {
        let locationButton = UIButton.init(type: .custom)
        locationButton.setImage(UIImage(named: "location"), for: .normal)
        locationButton.addTarget(self, action: #selector(locationClicked), for: .touchUpInside)
        
        let moreButton = UIButton.init(type: .custom)
        moreButton.setImage(UIImage(named: "more"), for: .normal)
        moreButton.addTarget(self, action: #selector(moreButtonClicked), for: .touchUpInside)
        
        let stackview = UIStackView.init(arrangedSubviews: [locationButton,moreButton])
        stackview.distribution = .equalSpacing
        stackview.axis = .horizontal
        stackview.spacing = 13
        
        let rightBarButton = UIBarButtonItem(customView: stackview)
        self.navigationItem.rightBarButtonItem = rightBarButton
        navigationController?.navigationBar.barTintColor = .backgroundColor
    }
    
    @objc private func moreButtonClicked(sender: Any) {
        presenter?.onDatePicker()
    }
    
    @objc private func locationClicked(sender: Any) {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                openSettingsURL()
            case .authorizedAlways, .authorizedWhenInUse:
                if let location = presenter?.userLocation {
                    callCityWeatherApi(location: location)
                }
            case .notDetermined:
                presenter?.addNoCityComponent(type: .locationUpdateFailure)
                break
            @unknown default:
                break
            }
        } else {
            openSettingsURL()
        }
    }
}

// Handling Location Changes for weather.
extension HomeViewController {
    private func checkLocationServicesStatus() {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                presenter?.addNoCityComponent(type: .locationDenied)
            case .authorizedAlways, .authorizedWhenInUse:
                if let location = locationManager.location {
                    presenter?.userLocation = location
                    callCityWeatherApi(location: location)
                    locationManager.stopUpdatingLocation()
                    locationManager.delegate = nil
                }
            case .notDetermined:
                break
            @unknown default:
                break
            }
        } else {
            presenter?.addNoCityComponent(type: .locationDenied)
        }
    }
    
    private func callCityWeatherApi(location: CLLocation) {
        ActivityIndicator.shared.addActivityIndicator(self.view)
        presenter?.getCityWeatherOnLocation(location: location)
        locationManager.stopUpdatingLocation()
    }
    
    private func openSettingsURL() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return}
        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in })
        }
    }
}






// Handling Location Updates.
extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(
        _ manager: CLLocationManager,
        didUpdateLocations locations: [CLLocation]
    ) {
        if let location = locations.first {
            callCityWeatherApi(location: location)
            presenter?.userLocation = location
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil
        }
    }
    
    func locationManager(
        _ manager: CLLocationManager,
        didFailWithError error: Error
    ) {
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() {
            case .restricted, .denied:
                presenter?.addNoCityComponent(type: .locationDenied)
            case .authorizedAlways, .authorizedWhenInUse:
                presenter?.addNoCityComponent(type: .locationUpdateFailure)
            case .notDetermined:
                break
            @unknown default:
                break
            }
        } else {
            presenter?.addNoCityComponent(type: .locationDenied)
        }
    }
}
