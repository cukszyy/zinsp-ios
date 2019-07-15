import UIKit

class ScreamTableViewCell: UITableViewCell {

    @IBOutlet weak var cardBackground: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCardView() {
        self.cardBackground.layer.cornerRadius = 5.0
    }

}
