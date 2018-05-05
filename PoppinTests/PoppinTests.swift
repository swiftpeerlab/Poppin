import XCTest
import MapKit
@testable import Poppin

class PoppinTests: XCTestCase {
    func testMainViewShouldBeMapKitView() {
        let viewController = MapViewController()

        let mapView = viewController.view

        XCTAssert(mapView is MKMapView)
    }
}
