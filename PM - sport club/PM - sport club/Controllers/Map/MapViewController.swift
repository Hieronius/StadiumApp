import UIKit
import CoreLocation
import MapKit
 
final class MapViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet private weak var filterScrollView: UIScrollView!
    @IBOutlet private var filterView: [UIView]!
    @IBOutlet private var filterButtonView: [UIButton]!
    @IBOutlet private weak var zoomToLocationButtonView: UIButton!
    @IBOutlet private weak var setRoutineButtonView: UIButton!
    
    // MARK: CalloutView
    
    @IBOutlet private weak var calloutView: UIView!
    @IBOutlet private weak var calloutImageView: UIImageView!
    @IBOutlet private weak var calloutLocationLabel: UILabel!
    @IBOutlet private weak var detailButtonView: UIButton!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var hoursOfWorkLabel: UILabel!
    @IBOutlet private weak var distanceLabel: UILabel!
    
    // MARK: - Private properties
    
    private let searchTextField = SearchTextField(placeholder: "Поиск")
    private let cleaningButton = CleaningButton()
    
    private let locationManager = CLLocationManager()
    
    private var mapPinsArray = [MKPointAnnotation]()
    private var soccerStadiumPins = [MKPointAnnotation]()
    private var basketballStadiumPins = [MKPointAnnotation]()
    private var hockeyStadiumPins = [MKPointAnnotation]()
    private var tennisStadiumPins = [MKPointAnnotation]()
    private var volleyballStadiumPins = [MKPointAnnotation]()
    
    private var userCurrentLocation: CLLocationCoordinate2D?
    private var selectedPinLocation: CLLocationCoordinate2D?
    
    private var isFilterButtonPressed = false
    private var specificFilteredPinsArray = [MKPointAnnotation]()
    
    private var regionInMeters: Double = 200
    
    private let mapViewPinDefaultImage = UIImage(named: "pin-1")
    private let mapViewPinUserLocationImage = UIImage(named: "pin")
    private let mapViewSelectedPinDefaultImage = UIImage(named: "pin-2")
    
    /// color from figma
    private let backgroundColor = UIColor(displayP3Red: 76/256,
                                          green: 47/256,
                                          blue: 162/256,
                                          alpha: 1)
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkLocationService()
        setupUI()
        getStadiumPins()
        addPins()
    }
    
    // MARK: - IBActions
    
    @IBAction private func zoomToCurrantLocation(_ sender: Any) {
        showMyLocationAndPlayground()
    }
    
    @IBAction private func filterButtonAction(_ sender: UIButton) {
        if !sender.isSelected {
            for button in filterButtonView {
                if button.isSelected {
                    button.isSelected = false
                    button.superview?.backgroundColor = .white
                    button.backgroundColor = .white
                    button.titleLabel?.tintColor = .systemGray
                    searchTextField.becomeFirstResponder()
                }
            }
            sender.superview?.backgroundColor = backgroundColor
            sender.titleLabel?.tintColor = .white
            sender.backgroundColor = backgroundColor
            sender.isSelected = true
            isFilterButtonPressed = true
            pressFilterButton()
            searchTextField.becomeFirstResponder()
            
        } else {
            sender.superview?.backgroundColor = .white
            sender.backgroundColor = .white
            sender.titleLabel?.tintColor = .systemGray
            sender.isSelected = false
            isFilterButtonPressed = false
            pressFilterButton()
        }
    }
    
    @objc private func cleanSearchTextField() {
        searchTextField.text = ""
        searchTextField.resignFirstResponder()
        if isFilterButtonPressed {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(specificFilteredPinsArray)
        } else {
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotations(mapPinsArray)
        }
    }
    
    @IBAction private func setRoutineButtonAction(_ sender: UIButton) {
         setDirection()
    }
    
    @IBAction func detailButtonAction(_ sender: Any) {
        let storyboard = UIStoryboard(name: "DetailViewController", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        let navController = UINavigationController(rootViewController: vc)
        self.present(navController, animated: true)
    }
    
    // MARK: - Private Methods
    
    private func setupUI() {
        setupSearchBar()
        setupCleaningButton()
        addActionToCleaningButton()
        setupFilterScrollView()
        setupZoomToLocationButton()
        setupRoutineButton()
        setupCalloutView()
    }
    
    // MARK: setupSearchBar
    
    private func setupSearchBar() {
        view.addSubview(searchTextField)
        searchTextField.delegate = self
        
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        
        searchTextField.addLeft(image: UIImage(named: "magnifyingglass")!)
        
        searchTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchTextField.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2).isActive = true
        searchTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92).isActive = true
        searchTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.05).isActive = true
    }
    
    // MARK: setupCleaningButton
    
    private func setupCleaningButton() {
        searchTextField.rightView = cleaningButton
        searchTextField.rightViewMode = .whileEditing
    }
    
    private func addActionToCleaningButton() {
        cleaningButton.addTarget(self, action: #selector(cleanSearchTextField), for: .touchUpInside)
    }
    
    // MARK: setupFilterScrollView
    
    private func setupFilterScrollView() {
        setupScrollView()
        setupButtonViewsFromScrollView()
        setupScrollViewButtons()
    }
    
    private func setupScrollView() {
        filterScrollView.translatesAutoresizingMaskIntoConstraints = false
        filterScrollView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 10).isActive = true
        filterScrollView.showsHorizontalScrollIndicator = false
    }
    
    private func setupButtonViewsFromScrollView() {
        for view in filterView {
            view.layer.cornerRadius = 15
        }
    }
    
    private func setupScrollViewButtons() {
        for button in filterButtonView {
              button.layer.cornerRadius = 15
        }
    }
    
    private func pressFilterButton() {
        if isFilterButtonPressed {
            for button in filterButtonView {
                if button.isSelected {
                    
                    switch button.titleLabel?.text {
                    case "Футбол":
                        mapView.removeAnnotations(mapPinsArray)
                        mapView.addAnnotations(soccerStadiumPins)
                        specificFilteredPinsArray = soccerStadiumPins
                        
                    case "Волейбол":
                        mapView.removeAnnotations(mapPinsArray)
                        mapView.addAnnotations(volleyballStadiumPins)
                        specificFilteredPinsArray = volleyballStadiumPins
                        
                    case "Теннис":
                        mapView.removeAnnotations(mapPinsArray)
                        mapView.addAnnotations(tennisStadiumPins)
                        specificFilteredPinsArray = tennisStadiumPins
                        
                    case "Баскетбол":
                        mapView.removeAnnotations(mapPinsArray)
                        mapView.addAnnotations(basketballStadiumPins)
                        specificFilteredPinsArray = basketballStadiumPins
                        
                    case "Хоккей":
                        mapView.removeAnnotations(mapPinsArray)
                        mapView.addAnnotations(hockeyStadiumPins)
                        specificFilteredPinsArray = hockeyStadiumPins
                        
                    default:
                        print("unknown filter")
                    }
                }
            }
            
        } else {
            mapView.addAnnotations(mapPinsArray)
        }
    }
    
    // MARK: zoomToLocationButton
    
    private func setupZoomToLocationButton() {
        zoomToLocationButtonView.setImage(UIImage(named: "active"), for: .selected)
        zoomToLocationButtonView.setImage(UIImage(named: "no active"), for: .normal)
    }
    
    // MARK: setupRoutineButton
    
    private func setupRoutineButton() {
        setRoutineButtonView.layer.cornerRadius = 25
        setRoutineButtonView.isHidden = true
    }
    
    // MARK: setupCalloutView
    
    private func setupCalloutView() {
        setupCalloutViewContainer()
        setupDetailButton()
        calloutView.isHidden = true
    }
    
    private func setupCalloutViewContainer() {
        calloutView.layer.cornerRadius = 30
        calloutView.clipsToBounds = true
    }
    
    private func setupDetailButton() {
        let title = "Подробнее"
        let attributes = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue, NSAttributedString.Key.font: UIFont(name: "Chalkduster", size: 12.0)!] as [NSAttributedString.Key : Any]
        let attributedTitle = NSAttributedString(string: title, attributes: attributes)
        detailButtonView.setAttributedTitle(attributedTitle, for: .normal)
    }
    
    // MARK: Get MapView Stadium Pins
    
    private func addPins() {
        mapPinsArray += soccerStadiumPins
        mapPinsArray += hockeyStadiumPins
        mapPinsArray += tennisStadiumPins
        mapPinsArray += volleyballStadiumPins
        mapPinsArray += basketballStadiumPins
        mapView.addAnnotations(mapPinsArray)
    }
    
    private func getStadiumPins() {
        getSoccerStadiumPins()
        getHockeyStadiumPins()
        getTennisStadiumPins()
        getBasketballStadiumPins()
        getVolleyballStadiumPins()
    }
    
    private func getSoccerStadiumPins() {
        for stadium in Stadiums.soccerStadiums {
            let pin = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: stadium.coordinates.latitude, longitude: stadium.coordinates.longtitude), title: stadium.name, subtitle: stadium.address)
            soccerStadiumPins.append(pin)
        }
    }
    
    private func getHockeyStadiumPins() {
        for stadium in Stadiums.hockeyStadiums {
            let pin = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: stadium.coordinates.latitude, longitude: stadium.coordinates.longtitude), title: stadium.name, subtitle: stadium.address)
            hockeyStadiumPins.append(pin)
        }
    }
    
    private func getTennisStadiumPins() {
        for stadium in Stadiums.tennisStadiums {
            let pin = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: stadium.coordinates.latitude, longitude: stadium.coordinates.longtitude), title: stadium.name, subtitle: stadium.address)
            tennisStadiumPins.append(pin)
        }
    }
    
    private func getVolleyballStadiumPins() {
        for stadium in Stadiums.volleyballStadiums {
            let pin = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: stadium.coordinates.latitude, longitude: stadium.coordinates.longtitude), title: stadium.name, subtitle: stadium.address)
            volleyballStadiumPins.append(pin)
        }
    }
    
    private func getBasketballStadiumPins() {
        for stadium in Stadiums.basketballStadiums {
            let pin = MKPointAnnotation(__coordinate: CLLocationCoordinate2D(latitude: stadium.coordinates.latitude, longitude: stadium.coordinates.longtitude), title: stadium.name, subtitle: stadium.address)
            basketballStadiumPins.append(pin)
        }
    }
    
    private func distanceBetweenTwoPointsInString(location1: CLLocation, location2: CLLocation) -> String {
        let distance = location1.distance(from: location2)
            
        if distance >= 1000 {
            return String(format: "~%.0f км", distance / 1000)
        } else {
            return String(format: "~%.0f м", distance)
        }
    }
    
    // MARK: checkLocationService
    
    private func checkLocationService() {
        guard CLLocationManager.locationServicesEnabled() else {
            // Show alert letting user know they have to turn this on.
            showAlert(title: "Ошибка",
                      message: "Включите использование геопозиции")
            
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings, options: [:], completionHandler: nil)
            }
            return
        }
        setupLocationManager()
        checkLocationAuthorization()
    }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
    }
    
    private func checkLocationAuthorization() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse, .authorizedAlways:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = true
            zoomToLocationButtonView.setImage(UIImage(named: "active"), for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                self.showMyLocationAndPlayground()
                self.userCurrentLocation = self.mapView.userLocation.coordinate
            }
            
        case .denied, .restricted:
            // Show alert instructing them how to turn on permissions
            showAlert(title: "Ошибка",
                      message: "Нет прав на использовние Ваших координат. Разрешите использовать Ваши координаты в настройках устройства")
            setMapViewRegion()
            zoomToLocationButtonView.isHidden = true
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            
        @unknown default:
            break
        }
    }
    
    private func showMyLocationAndPlayground() {
        self.mapView.zoomToUserLocation(latitudinalMeters: 5000, longitudinalMeters: 5000)
    }
    
    private func setMapViewRegion() {
        mapView.setRegion(MKCoordinateRegion(
            center: CLLocationCoordinate2D(
                latitude: Stadiums.soccerStadiums[0].coordinates.latitude,
                longitude: Stadiums.soccerStadiums[0].coordinates.longtitude),
            span: MKCoordinateSpan(
                latitudeDelta: 0.1,
                longitudeDelta: 0.1)),
        animated: false)
    }
    
    // MARK: Create routine between pins
    
     private func setDirection() {
         switch CLLocationManager.authorizationStatus() {
         case .denied, .restricted:
             showAlert(title: "Ошибка",
                       message: "Нет прав на использовние Ваших координат. Разрешите использовать Ваши координаты в настройках устройства")
         default: break
         }
         
         let overlays = mapView.overlays
         mapView.removeOverlays(overlays)
         
         let sourceCoordinate = userCurrentLocation ?? CLLocationCoordinate2D(latitude: 0, longitude: 0)
         let destinationCoordinate = selectedPinLocation ?? CLLocationCoordinate2D(latitude: 1, longitude: 1)
        
         let sourcePlacemark = MKPlacemark(coordinate: sourceCoordinate)
         let destinationPlacemark = MKPlacemark(coordinate: destinationCoordinate)
        
         let sourceMapItem = MKMapItem(placemark: sourcePlacemark)
         let destinationMapItem = MKMapItem(placemark: destinationPlacemark)
        
         let directionsRequest = MKDirections.Request()
         directionsRequest.source = sourceMapItem
         directionsRequest.destination = destinationMapItem
         directionsRequest.transportType = .walking
        
         let directions = MKDirections(request: directionsRequest)
        
           directions.calculate { response, error in
              guard let response = response else {
                print(error.debugDescription)
                return }
              let route = response.routes[0]
              self.mapView.addOverlay(route.polyline, level: .aboveRoads)
              let rect = route.polyline.boundingMapRect
              self.mapView.setVisibleMapRect(rect, edgePadding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10), animated: true)
        }
    }
   
}
 
// MARK: - Extension: CLLocationManagerDelegate

extension MapViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager,
                         didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        checkLocationAuthorization()
    }
}
 
// MARK: - Extension: MKMapRect

extension MKMapRect {

    init(coordinates: [CLLocationCoordinate2D]) {
        let points = coordinates.map { MKMapPoint($0) }
        let rects = points.map { MKMapRect(origin: $0,
                                           size: MKMapSize(width: 0, height: 0)) }
        self = rects.reduce(MKMapRect.null) { result, rect in
            return result.union(rect)
        }
    }
}

// MARK: - Extension: MKMapViewDelegate

extension MapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            let annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "userLocation")
            annotationView.image = mapViewPinUserLocationImage
            return annotationView
            
        } else {
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "custom")
            if annotationView == nil {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "custom")
            } else {
                annotationView?.annotation = annotation
            }
              annotationView?.image = mapViewPinDefaultImage
            return annotationView
        }
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        view.image = mapViewSelectedPinDefaultImage
        self.selectedPinLocation = view.annotation?.coordinate
        
        let allStadiumsInfoArray = Stadiums.basketballStadiums +
                                   Stadiums.hockeyStadiums +
                                   Stadiums.soccerStadiums +
                                   Stadiums.tennisStadiums +
                                   Stadiums.volleyballStadiums
        
        for stadium in allStadiumsInfoArray {
            if stadium.name == view.annotation?.title {
                calloutImageView.image = stadium.photo
                calloutLocationLabel.text = stadium.name
                addressLabel.text = stadium.address
                hoursOfWorkLabel.text = stadium.openHours
                
                let currentUserLocation = mapView.userLocation.coordinate
                let distance = distanceBetweenTwoPointsInString(location1: CLLocation(latitude:
                                                                                         userCurrentLocation?.latitude ?? currentUserLocation.latitude,
                                                                                            longitude:    userCurrentLocation?.longitude ?? currentUserLocation.longitude),
                                                                      location2: CLLocation(latitude:
                                                                                         selectedPinLocation!.latitude,                 longitude:         selectedPinLocation!.longitude))
                distanceLabel.text = distance
                SelectedStadium.shared.selectedStadium = stadium
                SelectedStadium.shared.selectedStadium?.currentDistanceTo = distance
            }
        }
        calloutView.isHidden = false
        setRoutineButtonView.isHidden = false
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = mapViewPinDefaultImage
        selectedPinLocation = nil
        calloutView.isHidden = true
        setRoutineButtonView.isHidden = true
        }
    
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        if overlay is MKPolyline {
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = backgroundColor
            render.lineWidth = 4
            render.lineDashPattern = [7]
            return render
        }
        return MKOverlayRenderer()
    }
    
}

// MARK: - Extension: UITextFieldDelegate

extension MapViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        mapView.removeAnnotations(mapPinsArray)
        
        let searchText = textField.text ?? ""
        if (searchText.isEmpty == true || searchText.count < 2) && isFilterButtonPressed == false {
            mapView.addAnnotations(mapPinsArray)
        }
        
        var filteredAnnotations = [MKPointAnnotation]()
        
        if searchText.count > 1 {
            if isFilterButtonPressed {
                filteredAnnotations = specificFilteredPinsArray.filter {($0.title! + $0.subtitle!).uppercased().contains(searchText.uppercased()) }
                mapView.removeAnnotations(specificFilteredPinsArray)
            } else {
                filteredAnnotations = mapPinsArray.filter {($0.title! + $0.subtitle!).uppercased().contains(searchText.uppercased()) }
                mapView.removeAnnotations(mapPinsArray)
            }
            
        } else {
            if isFilterButtonPressed {
                filteredAnnotations = specificFilteredPinsArray
            } else {
                filteredAnnotations = mapPinsArray
            }
        }
            mapView.addAnnotations(filteredAnnotations)
            textField.resignFirstResponder()
            
        return true
    }
    
}
