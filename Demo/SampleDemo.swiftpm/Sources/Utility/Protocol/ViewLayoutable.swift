import SnapKit
import UIKit

protocol ViewLayoutable {}

extension ViewLayoutable where Self: UIView {
    @discardableResult
    func addSubview(
        _ view: some UIView,
        closure: (ConstraintMaker) -> Void
    ) -> Self {
        addSubview(view)
        view.snp.makeConstraints(closure)
        return self
    }

    @discardableResult
    func addConstraint(closure: (ConstraintMaker) -> Void) -> Self {
        snp.makeConstraints(closure)
        return self
    }
}

extension UIView: ViewLayoutable {}
