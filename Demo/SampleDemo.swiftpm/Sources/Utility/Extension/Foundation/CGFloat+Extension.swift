import Foundation

extension CGFloat {
    static var deviceWidth: CGFloat {
        DeviceSize.width
    }

    static var deviceHeight: CGFloat {
        DeviceSize.height
    }

    static func apply(base size: CGFloat) -> CGFloat {
        size * DeviceSize.sizeRatio
    }
}
