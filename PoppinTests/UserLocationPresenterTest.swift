import XCTest
@testable import Poppin

class UserLocationPresenterTest: XCTestCase {

    let view = SpyMapView()
    let service = MockUserLocationService()

    func testShowErrorMessageIfUserLocationIsNotAvailable() {
        service.userLocationAvailable = false
        let presenter = UserLocationPresenter(view: view, service: service)

        presenter.locateUser()

        XCTAssert(view.showUserLocationNotAvailableCalled)
    }

    func testShowUserLocationIfUserLocationIsAvailable() {
        service.userLocationAvailable = true
        let presenter = UserLocationPresenter(view: view, service: service)

        presenter.locateUser()

        XCTAssert(view.showUserLocationCalled)
    }
}
