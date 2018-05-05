import XCTest

class UserLocationPresenterTest: XCTestCase {

    func testShowErrorMessageIfUserLocationIsNotAvailable() {
        let view = SpyMapView()
        let service = MockUserLocationService()
        service.userLocationAvailable = false
        let presenter = UserLocationPresenter(view: view, service: service)

        presenter.locateUser()

        XCTAssert(view.showUserLocationNotAvailableCalled)
    }

    func testShowUserLocationIfUserLocationIsAvailable() {
        let view = SpyMapView()
        let service = MockUserLocationService()
        service.userLocationAvailable = true
        let presenter = UserLocationPresenter(view: view, service: service)

        presenter.locateUser()

        XCTAssert(view.showUserLocationCalled)
    }
}

protocol MapView {
    func showUserLocationNotAvailable()
    func showUserLocation(location: Location)
}

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

protocol UserLocationService {
    func getUserLocation(completionHandler: ((Location?) -> Void))
}

class MockUserLocationService: UserLocationService {

    var userLocationAvailable: Bool!

    func getUserLocation(completionHandler: ((Location?) -> Void)) {
        if userLocationAvailable {
            completionHandler(Location(longitude: 0, latitude: 0))
        } else {
            completionHandler(nil)
        }
    }
}

struct Location {
    let longitude: Double
    let latitude: Double
}

struct UserLocationPresenter {

    let view: MapView
    let service: UserLocationService

    func locateUser() {
        service.getUserLocation { location in
            if let location = location {
                view.showUserLocation(location: location)
            } else {
                view.showUserLocationNotAvailable()
            }
        }
    }
}
