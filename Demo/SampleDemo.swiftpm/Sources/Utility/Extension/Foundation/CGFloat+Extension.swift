import Foundation

extension CGFloat {
    static var deviceWidth: CGFloat {
        Device.width
    }

    static var deviceHeight: CGFloat {
        Device.height
    }

    static func apply(base size: CGFloat) -> CGFloat {
        size * Device.sizeRatio
    }
}
