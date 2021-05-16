import Foundation
extension Date {
    public func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        return formatter.string(from: self)
    }
    
    public func isDatePrime() -> Bool {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy"
        let yearIntValue = Int(formatter.string(from: self)) ?? 0
        formatter.dateFormat = "MM"
        let monthIntValue = Int(formatter.string(from: self)) ?? 0
        formatter.dateFormat = "dd"
        let dayIntValue = Int(formatter.string(from: self)) ?? 0
        let dateNumber = dayIntValue + yearIntValue + monthIntValue
        return dateNumber.isPrime
    }
}
