import Foundation
import CoreLocation

class CLUserLocationService: NSObject, UserLocationService {

    private let locationManager = CLLocationManager()
    private var completionHandler: LocationHandler?

    func getUserLocation(completionHandler: @escaping LocationHandler) {
        self.completionHandler = completionHandler
        guard CLLocationManager.locationServicesEnabled() else {
            completionHandler(nil)
            return
        }
        manageAuthorizationStatus()
    }

    private func manageAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            completionHandler?(nil)
        case .authorizedWhenInUse, .authorizedAlways:
            startUpdatingLocation()
        }
    }

    func startUpdatingLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }
}

extension CLUserLocationService: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        completionHandler?(nil)
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let coordinate = manager.location?.coordinate else { return }
        completionHandler?(coordinate.location)
        locationManager.stopUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        manageAuthorizationStatus()
    }
}

