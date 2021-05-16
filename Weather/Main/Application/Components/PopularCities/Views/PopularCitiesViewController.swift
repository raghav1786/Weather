import UIKit
class PopularCitiesViewController: UIViewController {
    private var popularCitiesCollectionView: PopularCitiesCollectionView!
    private var contentView = UIStackView()
    private let constants = PopularCitiesConstants.self
    var presenter: PopularCitiesPresentable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.onViewDidLoad()
    }
}

extension PopularCitiesViewController: PopularCitiesViewable {
    func setData() {
        let popularCitiesLabel = makeLabel(with: constants.popularCitiesLabel)
        popularCitiesLabel
            .setContentHuggingPriority(
                .init(rawValue: constants.popularCitiesLabelContentHuggingPriority), for: .vertical)
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        
        let heightConstraint = NSLayoutConstraint.init(item: contentView, attribute: .height, relatedBy: .equal, toItem: self.view, attribute: .height, multiplier: 1, constant: 0)
        heightConstraint.priority = UILayoutPriority.init(constants.uiLayoutPriority)
        self.view.addSubview(contentView)
        self.view.addConstraints([
            self.contentView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.contentView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.contentView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        
        self.view.addConstraints([
            self.contentView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            heightConstraint,
        ])
        
        self.popularCitiesCollectionView = makePopularCitiesCollectionView()
        self.popularCitiesCollectionView.register(PopularCitiesCollectionViewCell.self, forCellWithReuseIdentifier: PopularCitiesCollectionViewCell.identifier)
        
        let bottomStack = UIStackView(arrangedSubviews: [popularCitiesLabel,popularCitiesCollectionView])
        bottomStack.translatesAutoresizingMaskIntoConstraints = false
        bottomStack.axis = .vertical
        self.contentView.addSubview(bottomStack)
        
        self.contentView.addConstraints([
            bottomStack.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            bottomStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            bottomStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            bottomStack.heightAnchor
                .constraint(greaterThanOrEqualToConstant: self.popularCitiesCollectionView.contentSize.height + 30)
        ])
    }
}

extension PopularCitiesViewController {
    private func makePopularCitiesCollectionView() -> PopularCitiesCollectionView {
        
        let layout = CustomViewFlowLayout.init()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        layout.scrollDirection = .vertical
        let popularCitiesCollectionView = PopularCitiesCollectionView.init(frame: .zero, collectionViewLayout: layout)
        popularCitiesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        popularCitiesCollectionView.delegate = self
        popularCitiesCollectionView.dataSource = self
        popularCitiesCollectionView.backgroundColor = .clear
        return popularCitiesCollectionView
    }
    
    private func makeLabel(with text: String) -> UILabel {
        let titleLabel = UILabel()
        titleLabel.text = text
        titleLabel.font = .title()
        titleLabel.numberOfLines = 0
        titleLabel.textColor = .appRed
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }
}

extension PopularCitiesViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //Datasource Methods
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        presenter?.cityList.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = self.popularCitiesCollectionView
                .dequeueReusableCell(withReuseIdentifier: PopularCitiesCollectionViewCell.identifier,
                                     for: indexPath) as? PopularCitiesCollectionViewCell
        else { return PopularCitiesCollectionViewCell() }
        guard var city = presenter?.cityList[indexPath.item] else {return PopularCitiesCollectionViewCell() }
        if city.name == presenter?.userLocationCity {
            city.name = PopularCitiesConstants.myLocationLabel
        }
        cell.city = city
        return cell
    }
}

extension PopularCitiesViewController: UICollectionViewDelegate {
    //Delegate Methods
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let city = presenter?.cityList[indexPath.item] else { return }
        presenter?.getWeatherForSelectedCity(cityName: city.name)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        var text = ""
        guard let city = presenter?.cityList[indexPath.item] else { return CGSize() }
        text = city.name
        let cellWidth = text.size(withAttributes:[.font: UIFont
                                                    .desc()]).width + 30.0
        return CGSize(width: cellWidth, height: 30.0)
    }
}
