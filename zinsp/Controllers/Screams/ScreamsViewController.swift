import UIKit

class ScreamsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var profileCard: UIView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var editProfileButton: UIButton!
    @IBOutlet weak var backgroundButton: UIButton!
    @IBOutlet weak var profileCardHorizontalConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavBar()
        setupProfileCard()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTablePresentention()
    }
    
    func setupProfileCard() {
        self.profileCard.layer.cornerRadius = 10
        self.profileCard.layer.masksToBounds = true
        self.editProfileButton.layer.cornerRadius = 5
        
        let width = self.profilePicture.frame.width
        self.profilePicture.layer.cornerRadius = width / 2
        self.profilePicture.layer.borderColor = UIColor.gray.cgColor
        self.profilePicture.layer.borderWidth = 2.0
    }
    
    @IBAction func dismissProfileCard(_ sender: Any) {
        self.profileCardHorizontalConstraint.constant = 600
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
            self.backgroundButton.alpha = 0
        }
    }
}

extension ScreamsViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "screamCell", for: indexPath)
        
        cell.textLabel?.text = "Test label \(indexPath.row)"
        
        return cell
    }
    
    func animateTablePresentention() {
        self.tableView.reloadData()
        let visibleCells = self.tableView.visibleCells
        let tableViewHeight = self.tableView.bounds.height
        
        for cell in visibleCells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        var delay = 0
        for cell in visibleCells {
            UIView.animate(withDuration: 2, delay: Double(delay) * 0.05, usingSpringWithDamping: 0.9, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }) { (success: Bool) in
                delay += 1
            }
        }
    }
}
