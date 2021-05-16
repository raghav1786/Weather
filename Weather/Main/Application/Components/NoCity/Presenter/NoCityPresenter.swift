class NoCityPresenter {
    weak private var view: NoCityViewable?
    private var interactor: NoCityInteracting?
    init(view: NoCityViewable, interactor: NoCityInteracting) {
        self.view = view
        self.interactor = interactor
    }
}

extension NoCityPresenter: NoCityPresentable {
    func onViewDidLoad() {
        guard let model = self.interactor?.getNoCityModule() else { return }
        self.view?.initializeView(model: model)
    }
}
