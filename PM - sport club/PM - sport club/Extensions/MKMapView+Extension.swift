import MapKit

extension MKMapView {
  func zoomToUserLocation() {
     self.zoomToUserLocation(latitudinalMeters: 1000, longitudinalMeters: 1000)
  }

  func zoomToUserLocation(latitudinalMeters:CLLocationDistance,longitudinalMeters:CLLocationDistance)
  {
    guard let coordinate = userLocation.location?.coordinate else { return }
    self.zoomToLocation(location: coordinate, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
  }

  func zoomToLocation(location : CLLocationCoordinate2D,latitudinalMeters:CLLocationDistance = 100,longitudinalMeters:CLLocationDistance = 100)
  {
      let region = MKCoordinateRegion(center: location, latitudinalMeters: latitudinalMeters, longitudinalMeters: longitudinalMeters)
    setRegion(region, animated: true)
  }

}
