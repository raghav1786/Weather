protocol HomeRouting {
    func makeWheatherCardModule(weatherDataModel: WeatherDataModel) -> WeatherComponentView
    func openDatePickerModule(delegate: DatePickerDelegate, cityName: String)
    func makeNoCityModule(noCityModel: NoCityUIModel) -> WeatherComponentView
    func makePopularCitiesModule(popularCitiesDataModel: PopularCitiesDataModel) -> WeatherComponentView
}
