import CoreLocation

extension CLLocationCoordinate2D {
    var location: Location {
        return Location(latitude: latitude, longitude: longitude)
    }
}

extension Location {
    var CLLocation: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
