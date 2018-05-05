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
