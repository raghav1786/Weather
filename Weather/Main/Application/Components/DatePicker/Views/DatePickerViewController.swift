import UIKit
class DatePickerViewController: UIViewController {
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var datePickerDescLabel: UILabel!
    @IBOutlet private weak var cityNameLabel: UILabel!
    @IBOutlet private weak var cityNameValue: UILabel!
    var presenter: DatePickerPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = DatePickerConstants.titleLabel
        showCancelButtonOnNavBar()
        presenter?.onViewDidLoad()
    }
    
    private func setFonts() {
        datePickerDescLabel.font = .title()
        cityNameLabel.font = .desc()
        cityNameValue.font = .desc()
    }
    
    private func showCancelButtonOnNavBar() {
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(popToPrevious))
        cancelItem.tintColor = .black
        self.navigationItem.leftBarButtonItem = cancelItem
    }
    
    @objc private func popToPrevious() {
        navigationController?.popViewController(animated: true)
    }
    
    private func showDatePicker(){
        datePicker.datePickerMode = .date
        datePicker.tintColor = .black
        datePicker.sizeToFit()
        datePicker.addTarget(self, action: #selector(dateChanged), for: .valueChanged)
    }
    
    @objc private func dateChanged(sender: Any) {
        if datePicker.date.isDatePrime() {
            presenter?.getSelectedDate(date: datePicker.date)
            self.navigationController?.popViewController(animated: true)
            self.view.endEditing(true)
        } else {
            showToast(message: DatePickerConstants.notPrimeToast)
        }
    }
}

extension DatePickerViewController: DatePickerViewable {
    func setData(model: DatePickerModel) {
        setFonts()
        cityNameValue.text = model.cityNameValue
        datePickerDescLabel.text = model.datePickerDesc
        cityNameLabel.text = model.currentCityLabel
        showDatePicker()
    }
}
