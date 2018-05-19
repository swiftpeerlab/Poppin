import UIKit
import MapKit
import TinyConstraints

class MapViewController: UIViewController {

    lazy var userLocationService = CLUserLocationService()
    lazy var presenter = UserLocationPresenter(view: self, service: userLocationService)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MKMapView()
        addLocateUserButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.locateUser()
    }

    func addLocateUserButton() {
        let locateUserButton = LocateUserButton.build()
        view.addSubview(locateUserButton)
        locateUserButton.top(to: view.safeAreaLayoutGuide).constant = 8
        locateUserButton.trailingToSuperview().constant = -8
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
