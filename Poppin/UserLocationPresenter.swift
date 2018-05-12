struct UserLocationPresenter {

    let view: MapView
    let service: UserLocationService

    func locateUser() {
        service.getUserLocation { location in
            if let location = location {
                self.view.showUserLocation(location: location)
            } else {
                self.view.showUserLocationNotAvailable()
            }
        }
    }
}
