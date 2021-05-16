import Foundation
class DatePickerInteractor {
    private var delegate: DatePickerDelegate?
    private var cityName: String
    init(delegate: DatePickerDelegate?,cityName: String) {
        self.delegate = delegate
        self.cityName = cityName
    }
}

extension DatePickerInteractor: DatePickerInteracting {
    func getDatePickerModelData() -> DatePickerModel {
        return DatePickerModel(datePickerDesc: DatePickerConstants.datePickerDesc,
                               delegate: delegate,
                               cityNameValue: cityName,
                               currentCityLabel: DatePickerConstants.cityNameDesc)
    }
}
