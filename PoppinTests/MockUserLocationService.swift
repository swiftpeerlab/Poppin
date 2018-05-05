@testable import Poppin

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
