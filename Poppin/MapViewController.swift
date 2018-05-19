import UIKit
import MapKit
import TinyConstraints

class MapViewController: UIViewController {

    private lazy var userLocationService = CLUserLocationService()
    private lazy var presenter = UserLocationPresenter(view: self, service: userLocationService)

    override func viewDidLoad() {
        super.viewDidLoad()
        view = MKMapView()
        addLocateUserButton()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locateUser()
    }

    private func addLocateUserButton() {
        let locateUserButton = LocateUserButton.build()
        locateUserButton.addTarget(self, action: #selector(locateUser), for: .touchUpInside)
        view.addSubview(locateUserButton)
        locateUserButton.top(to: view.safeAreaLayoutGuide).constant = 8
        locateUserButton.leadingToSuperview().constant = 8
    }

    @objc private func locateUser() {
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
