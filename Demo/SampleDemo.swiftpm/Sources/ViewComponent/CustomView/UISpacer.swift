import UIKit

// MARK: - properties & init

final class UISpacer: UIView {}

// MARK: - internal methods

extension UISpacer {
    func setBgColor(_ color: UIColor) {
        backgroundColor = color
    }
}

// MARK: - preview

#if DEBUG
    import SwiftUI

    @available(iOS 17.0, *)
    #Preview(traits: .sizeThatFitsLayout) {
        UISpacer()
    }

    struct UISpacerPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: UISpacer())
        }
    }
#endif
