import UIKit

class EnableLocationView {
    static func show() {
        let message = MDCSnackbarMessage()
        message.text = "Enable your location to see events near you"
        let action = MDCSnackbarMessageAction()
        action.handler = {
            guard let url = URL(string: UIApplicationOpenSettingsURLString) else { return }
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
        action.title = "Enable"
        message.action = action
        message.duration = 10
        MDCSnackbarManager.show(message)
    }
}
