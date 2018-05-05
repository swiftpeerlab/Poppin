@testable import Poppin

class SpyMapView: MapView {

    var showUserLocationNotAvailableCalled = false
    var showUserLocationCalled = false

    func showUserLocationNotAvailable() {
        showUserLocationNotAvailableCalled = true
    }

    func showUserLocation(location: Location){
        showUserLocationCalled = true
    }
}
