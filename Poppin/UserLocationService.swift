protocol UserLocationService {
    func getUserLocation(completionHandler: ((Location?) -> Void))
}
