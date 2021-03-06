
import Foundation
import UIKit

class ActivityIndicator {
    static let shared = ActivityIndicator()
    private init() {}
    private var activityIndicator = UIActivityIndicatorView()
    private var strLabel = UILabel()
    let effectView = UIVisualEffectView(effect: UIBlurEffect(style: .dark))
    
    public func addActivityIndicator(_ parentView : UIView) {
        setUpFrames(parentView)
        setUpTheme()
        setUpFonts()
        
        effectView.layer.cornerRadius = 15
        effectView.layer.masksToBounds = true
        
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        effectView.contentView.addSubview(activityIndicator)
        effectView.contentView.addSubview(strLabel)
        parentView.addSubview(effectView)
    }
    
    private func setUpFrames(_ parentView : UIView) {
        strLabel = UILabel(frame: CGRect(x: 15, y: 40, width: 160, height: 46))
        effectView.frame = CGRect(x: parentView.frame.midX - 80,
        y: parentView.frame.midY - 11,
        width: 150,
        height: 92)
        activityIndicator.frame = CGRect(x: 50, y: 25, width: 46, height: 46)
    }
    
    private func setUpTheme() {
        strLabel.textColor = .white
        activityIndicator.color = .white
    }
    
    private func setUpFonts() {
        strLabel.font = .systemFont(ofSize: 14, weight: UIFont.Weight.bold)
    }
    
    public func removeActivityIndicator() {
        activityIndicator.removeFromSuperview()
        effectView.removeFromSuperview()
        strLabel.removeFromSuperview()
    }
    
    public func stopAnimation() {
        activityIndicator.stopAnimating()
    }
}
