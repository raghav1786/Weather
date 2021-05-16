import Foundation
public class TemperatureConversionUtil {
    static let shared = TemperatureConversionUtil()
    private init() {}
    private let mf = MeasurementFormatter()
    
    public func convertTemp(temp: Double, from inputTempType: UnitTemperature, to outputTempType: UnitTemperature) -> String {
        mf.numberFormatter.maximumFractionDigits = 0
        mf.unitOptions = .providedUnit
        let input = Measurement(value: temp,unit: inputTempType)
        let output = input.converted(to: outputTempType)
        return mf.string(from: output)
    }
}
