import Foundation
class DatePickerPresenter {
    private weak var view: DatePickerViewable?
    private weak var delegate: DatePickerDelegate?
    var interactor: DatePickerInteracting?
    init(view: DatePickerViewable,
         interactor: DatePickerInteracting) {
        self.view = view
        self.interactor = interactor
    }
}

extension DatePickerPresenter: DatePickerPresentable {
    func onViewDidLoad() {
        guard let model = self.interactor?.getDatePickerModelData() else { return }
        self.delegate = model.delegate
        self.view?.setData(model: model)
    }
    
    func formattedDate(_ date: Date) -> String {
        return date.formattedDate()
    }
    
    func getSelectedDate(date: Date) {
        delegate?.onSelectedDate(date: date)
    }
}
