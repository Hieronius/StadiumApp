import UIKit

final class WelcomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var welcomeLabel: UILabel!
    @IBOutlet private weak var welcomeContinueButton: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         setupUI()
    }

    // MARK: - IBActions
    
    @IBAction func welcomeContinueButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "MapViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "MapViewController") as! MapViewController
        self.navigationController?.setViewControllers([vc], animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupWelcomeContinueButton()
    }
    
    private func setupWelcomeContinueButton() {
        welcomeContinueButton.layer.cornerRadius = 14
    }
    
}

