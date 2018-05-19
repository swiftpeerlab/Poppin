import UIKit

class LocateUserButton {

    static func build() -> UIView {
        let cursorImage = #imageLiteral(resourceName: "cursor").withRenderingMode(.alwaysTemplate)
        let button = MDCFloatingButton()
        button.setImage(cursorImage, for: .normal)
        button.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        button.backgroundColor = #colorLiteral(red: 0.3764705882, green: 0.5019607843, blue: 0.7803921569, alpha: 1)
        button.inkColor = #colorLiteral(red: 0.3960784314, green: 0.3607843137, blue: 0.7294117647, alpha: 1)
        return button
    }
}
