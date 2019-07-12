import UIKit

class ScreamListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animateTablePresentention()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "screamCell", for: indexPath)

        cell.textLabel?.text = "Test label \(indexPath.row)"
        
        return cell
    }
    
    func animateTablePresentention() {
        tableView.reloadData()
        let visibleCells = tableView.visibleCells
        let tableViewHeight = tableView.bounds.height
        
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
