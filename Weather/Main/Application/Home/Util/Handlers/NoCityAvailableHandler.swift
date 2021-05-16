public class NoCity {
    public enum NoCityUseCase {
        case locationUpdateFailure
        case apiFailure
        case locationDenied
    }
    
    static let errorLocationMessage = "For better experience.\nPlease allow your location to see weather at your place"
    static let errorApiMessage = "We are unable to process the weather.\nPlease retry after sometime"
    static let errorLocationFailureMessage = "We are unable to process your location at the moment.\nPlease retry after sometime"
    
    public func getNoCityDataModel(type: NoCityUseCase) -> NoCityUIModel {
        switch type {
        case .locationDenied:
            return NoCityUIModel(errorMessage: NoCity.errorLocationMessage)
        case .locationUpdateFailure:
            return NoCityUIModel(errorMessage: NoCity.errorLocationFailureMessage)
        case .apiFailure:
            return NoCityUIModel(errorMessage: NoCity.errorApiMessage)
        }
    }
}
