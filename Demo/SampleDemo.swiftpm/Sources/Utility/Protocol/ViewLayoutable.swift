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
    func addConstraint(_ closure: (ConstraintMaker) -> Void) -> Self {
        snp.makeConstraints(closure)
        return self
    }

    @discardableResult
    func width(_ size: CGFloat) -> Self {
        snp.makeConstraints {
            $0.width.equalTo(size)
        }

        return self
    }

    @discardableResult
    func height(_ size: CGFloat) -> Self {
        snp.makeConstraints {
            $0.height.equalTo(size)
        }

        return self
    }

    @discardableResult
    func size(_ size: CGFloat) -> Self {
        snp.makeConstraints {
            $0.size.equalTo(size)
        }

        return self
    }
}

extension UIView: ViewLayoutable {}
