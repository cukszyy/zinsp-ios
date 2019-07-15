import UIKit

class LoginController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func bounce(_ bounds: CGRect) {
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: .curveEaseInOut, animations: {
            self.loginButton.bounds = CGRect(x: bounds.origin.x - 20, y: bounds.origin.y, width: bounds.size.width + 60, height: bounds.size.height)
        }) { (success: Bool) in
            if success {
                self.performSegue(withIdentifier: "showScreams", sender: nil)
            }
        }
    }

    @IBAction func login(_ sender: Any) {
        let bounds = loginButton.bounds
        bounce(bounds)
    }
}

extension LoginController {
    // TODO: add Firebase auth
}

