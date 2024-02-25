import UIKit

final class DetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var titleViewContainer: UIView!
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var closeButtonView: UIButton!
    @IBOutlet private weak var titleView: UILabel!
    @IBOutlet private weak var addressLableView: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    @IBOutlet private weak var hoursOfWorkLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var openWebsiteButtonView: UIButton!
    @IBOutlet private weak var reservationButtonView: UIButton!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getDetailData()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setupNavigationBar()
    }
    
    // MARK: - IBActions
    
    @IBAction private func closeButtonAction(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction private func openWebsiteButtonAction(_ sender: UIButton) {
        if openWebsiteButtonView.titleLabel?.text != "Не указан" {
            if let url = URL(string: "\((openWebsiteButtonView.titleLabel?.text)!)") {
                UIApplication.shared.open(url)
            }
        }
    }
    
    @IBAction private func reservationButtonAction(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "ReservationViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ReservationViewController") as! ReservationViewController
         self.navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupTitleViewContainer()
        setupCloseButtonView()
        setupReservationButtonView()
    }
    
    private func getDetailData() {
        titleImageView.image = SelectedStadium.shared.selectedStadium?.photo
        titleView.text = SelectedStadium.shared.selectedStadium?.name
        addressLableView.text = SelectedStadium.shared.selectedStadium?.address
        distanceLabel.text = SelectedStadium.shared.selectedStadium?.currentDistanceTo
        hoursOfWorkLabel.text = SelectedStadium.shared.selectedStadium?.openHours
        phoneLabel.text = SelectedStadium.shared.selectedStadium?.phoneNumber
        
        let font = UIFont.systemFont(ofSize: 12)
        let title = SelectedStadium.shared.selectedStadium!.webSite
        let attributes = [NSAttributedString.Key.font: font] as [NSAttributedString.Key : Any]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        openWebsiteButtonView.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    private func setupNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupTitleViewContainer() {
        titleViewContainer.clipsToBounds = true
        titleViewContainer.layer.cornerRadius = 25
        titleViewContainer.layer.maskedCorners = [.layerMinXMinYCorner,
                                                  .layerMaxXMinYCorner]
    }
    
    private func setupCloseButtonView() {
        closeButtonView.setTitle("", for: .normal)
    }
    
    private func setupReservationButtonView() {
        reservationButtonView.layer.cornerRadius = 25
    }
    
}
