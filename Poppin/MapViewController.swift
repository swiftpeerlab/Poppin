import UIKit
import MapKit

class MapViewController: UIViewController {

    lazy var userLocationService = CLUserLocationService()
    lazy var presenter = UserLocationPresenter(view: self, service: userLocationService)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MKMapView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.locateUser()
    }
}

extension MapViewController: MapView {

    func showUserLocationNotAvailable() {
        EnableLocationView.show()
    }

    func showUserLocation(location: Location) {
        guard let mapView = view as? MKMapView else { return }
        mapView.setCenter(location.CLLocation, animated: true)
        mapView.showsUserLocation = true
    }
}
