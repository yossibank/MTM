import SwiftUI

extension View {
    func width(_ base: CGFloat) -> some View {
        frame(width: .apply(base: base))
    }

    func height(_ base: CGFloat) -> some View {
        frame(height: .apply(base: base))
    }

    func size(
        _ base: CGFloat,
        alignment: Alignment = .center
    ) -> some View {
        frame(
            width: .apply(base: base),
            height: .apply(base: base),
            alignment: alignment
        )
    }
}
