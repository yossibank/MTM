import UIKit

enum DeviceSize {
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

enum Device {
    case iPhone6s
    case iPhone6sPlus
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhone12
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPhone13Mini
    case iPhone14
    case iPhone14Plus
    case iPhone14Pro
    case iPhone14ProMax
    case iPhone15
    case iPhone15Plus
    case iPhone15Pro
    case iPhone15ProMax
    case iPhoneSE1st
    case iPhoneSE2nd
    case iPhoneSE3rd
    case iPhoneX
    case iPhoneXs
    case iPhoneXsMax
    case iPhoneXr

    var width: CGFloat {
        switch self {
        case .iPhoneSE1st:
            320
        case .iPhone6s,
             .iPhone7,
             .iPhone8,
             .iPhone11Pro,
             .iPhone13Mini,
             .iPhoneSE2nd,
             .iPhoneSE3rd,
             .iPhoneX,
             .iPhoneXs:
            375
        case .iPhone12,
             .iPhone12Pro,
             .iPhone13,
             .iPhone13Pro,
             .iPhone14:
            390
        case .iPhone14Pro,
             .iPhone15,
             .iPhone15Pro:
            393
        case .iPhone6sPlus,
             .iPhone7Plus,
             .iPhone8Plus,
             .iPhone11,
             .iPhone11ProMax,
             .iPhoneXsMax,
             .iPhoneXr:
            414
        case .iPhone12ProMax,
             .iPhone13ProMax,
             .iPhone14Plus:
            428
        case .iPhone14ProMax,
             .iPhone15Plus,
             .iPhone15ProMax:
            430
        }
    }
}
