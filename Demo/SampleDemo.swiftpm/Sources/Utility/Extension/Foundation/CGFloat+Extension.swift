import Foundation

extension CGFloat {
    static func apply(base size: CGFloat) -> CGFloat {
        size * DeviceSize.sizeRatio
    }
}
