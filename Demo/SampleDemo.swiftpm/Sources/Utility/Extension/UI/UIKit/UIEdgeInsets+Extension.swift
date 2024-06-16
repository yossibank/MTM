import UIKit

extension UIEdgeInsets {
    enum EdgeInsetsDirection {
        case top
        case right
        case bottom
        case left
        case horizontal
        case vertical
        case all
    }

    init(
        _ direction: EdgeInsetsDirection,
        padding: CGFloat
    ) {
        switch direction {
        case .top:
            self.init(top: padding, left: 0, bottom: 0, right: 0)
        case .right:
            self.init(top: 0, left: 0, bottom: 0, right: padding)
        case .bottom:
            self.init(top: 0, left: 0, bottom: padding, right: 0)
        case .left:
            self.init(top: 0, left: padding, bottom: 0, right: 0)
        case .horizontal:
            self.init(top: 0, left: padding, bottom: 0, right: padding)
        case .vertical:
            self.init(top: padding, left: 0, bottom: padding, right: 0)
        case .all:
            self.init(top: padding, left: padding, bottom: padding, right: padding)
        }
    }

    init(
        _ directions: [EdgeInsetsDirection],
        padding: CGFloat
    ) {
        var insets: UIEdgeInsets = .init(top: 0, left: 0, bottom: 0, right: 0)

        for direction in directions {
            switch direction {
            case .top:
                insets.top = padding
            case .left:
                insets.left = padding
            case .bottom:
                insets.bottom = padding
            case .right:
                insets.right = padding
            case .horizontal:
                insets.left = padding
                insets.right = padding
            case .vertical:
                insets.top = padding
                insets.bottom = padding
            case .all:
                insets.top = padding
                insets.left = padding
                insets.bottom = padding
                insets.right = padding
            }
        }

        self.init(
            top: insets.top,
            left: insets.left,
            bottom: insets.bottom,
            right: insets.right
        )
    }
}
