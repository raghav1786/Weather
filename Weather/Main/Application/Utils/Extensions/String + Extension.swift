import Foundation
extension String {
    public func doubleFormat() -> Double? {
        let str =  self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        return Double(str)
    }
}
