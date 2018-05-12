protocol UserLocationService {
    typealias LocationHandler = ((Location?) -> Void)
    func getUserLocation(completionHandler: @escaping LocationHandler)
}
