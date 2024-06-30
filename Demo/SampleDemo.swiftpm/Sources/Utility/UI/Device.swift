import UIKit

enum Device {
    static var width: CGFloat {
        screenSize.width
    }

    static var height: CGFloat {
        screenSize.height
    }

    static var sizeRatio: CGFloat {
        width / baseWidth
    }

    private static var screenSize: CGRect {
        UIWindow.connectedWindowScene?.screen.bounds ?? .zero
    }

    private static let baseWidth: CGFloat = 375
}
