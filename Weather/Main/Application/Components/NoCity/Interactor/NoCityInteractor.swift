class NoCityInteractor {
    private var noCityModel: NoCityUIModel
    init(noCityModel: NoCityUIModel) {
        self.noCityModel = noCityModel
    }
}

extension NoCityInteractor: NoCityInteracting {
    func getNoCityModule() -> NoCityUIModel {
        return noCityModel
    }
}
