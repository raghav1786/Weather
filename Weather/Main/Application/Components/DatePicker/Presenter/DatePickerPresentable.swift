import Foundation
protocol DatePickerPresentable {
    func onViewDidLoad()
    func formattedDate(_ date: Date) -> String
    func getSelectedDate(date: Date)
}
