import UIKit
class NoCityViewController: UIViewController {
    @IBOutlet private weak var errorLabel: UILabel!
    
    var presenter: NoCityPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
    
    private func setFonts() {
        errorLabel.font = .desc()
    }
}

extension NoCityViewController: NoCityViewable {
    func initializeView(model: NoCityUIModel) {
        setFonts()
        errorLabel.text = model.errorMessage
    }
}
