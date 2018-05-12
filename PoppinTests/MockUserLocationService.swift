@testable import Poppin

class MockUserLocationService: UserLocationService {

    var userLocationAvailable: Bool!

    func getUserLocation(completionHandler: @escaping LocationHandler) {
        if userLocationAvailable {
            completionHandler(Location(latitude: 0, longitude: 0))
        } else {
            completionHandler(nil)
        }
    }
}
