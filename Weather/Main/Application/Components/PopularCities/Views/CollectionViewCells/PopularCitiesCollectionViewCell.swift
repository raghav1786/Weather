import UIKit
class PopularCitiesCollectionViewCell: BaseCollectionViewCell {
    static let identifier = PopularCitiesConstants.popularCitiesCollectionViewCellID
    
    var city: City? {
        didSet{
            guard let sender = self.city else { return }
            self.titleLabel.text = sender.name
        }
    }
    
    var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textAlignment = .center
        lbl.font = .desc()
        lbl.lineBreakMode = .byTruncatingMiddle
        lbl.textColor = .white
        return lbl
    }()
    
    override func setupViews() {
        
        self.titleLabel.text = nil
        self.layer.cornerRadius = 14.0
        self.layer.backgroundColor = .suggestionBackground
        self.contentView.addSubview(titleLabel)
        
        self.addConstraints([
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }
}
