import XCTest

class UserLocationPresenterTest: XCTestCase {

    func testShowErrorMessageIfUserLocationIsNotAvailable() {
        let view = SpyMapView()
        let presenter = UserLocationPresenter(view: view)

        presenter.locateUser()

        XCTAssert(view.showUserLocationNotAvailableCalled)
    }
}

protocol MapView {
    func showUserLocationNotAvailable()
}

class SpyMapView: MapView {

    var showUserLocationNotAvailableCalled = false

    func showUserLocationNotAvailable() {
        showUserLocationNotAvailableCalled = true
    }
}

struct UserLocationPresenter {

    let view: MapView

    func locateUser() {
        view.showUserLocationNotAvailable()
    }
}
