import UIKit

class LocateUserButton {

    static func build() -> UIView {
        let plusImage = UIImage(named: "cursor")?.withRenderingMode(.alwaysTemplate)
        let button = MDCFloatingButton()
        button.setImage(plusImage, for: .normal)
        return button
    }
}
