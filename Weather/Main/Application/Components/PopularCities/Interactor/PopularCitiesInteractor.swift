class PopularCitiesInteractor {
    private var popularCitiesDataModel: PopularCitiesDataModel?
    init(popularCitiesDataModel: PopularCitiesDataModel) {
        self.popularCitiesDataModel = popularCitiesDataModel
    }
}

extension PopularCitiesInteractor: PopularCitiesInteracting {
    func getPopularCitiesDataModel() -> PopularCitiesDataModel? {
        return popularCitiesDataModel
    }
}
