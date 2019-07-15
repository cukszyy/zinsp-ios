import UIKit

extension ScreamsViewController {
    func setupNavBar() {
        setupLeftItems()
    }
    
    private func setupLeftItems() {
        let width: CGFloat = 38
        let height: CGFloat = 38
        
        let profilePicture = UIButton(type: .system)
        profilePicture.setImage(UIImage(named: "placeholderProfilePicture")?.withRenderingMode(.alwaysOriginal), for: .normal)
        profilePicture.frame = CGRect(x: 0, y: 0, width: width, height: height)
        profilePicture.layer.cornerRadius = width / 2
        profilePicture.layer.borderWidth = 1
        profilePicture.layer.borderColor = UIColor.black.cgColor
        profilePicture.layer.masksToBounds = true
        profilePicture.addTarget(self, action: #selector(showProfileView), for: .touchUpInside)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: profilePicture)
    }
    
    @objc
    fileprivate func showProfileView() {
        print("showing new profile")
        self.profileCardHorizontalConstraint.constant = 0
        
        UIView.animate(withDuration: 0.5) {
            self.view.layoutIfNeeded()
            self.backgroundButton.alpha = 0.8
        }
    }
    
    
}
