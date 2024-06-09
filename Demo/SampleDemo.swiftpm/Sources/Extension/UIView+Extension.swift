import SnapKit
import UIKit

extension UIView {
    func addSubview(
        _ view: some UIView,
        closure: (ConstraintMaker) -> Void
    ) {
        addSubview(view)
        view.snp.makeConstraints(closure)
    }

    func addConstraint(closure: (ConstraintMaker) -> Void) {
        snp.makeConstraints(closure)
    }
}
