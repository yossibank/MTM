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
    func size(
        width: CGFloat? = nil,
        height: CGFloat? = nil
    ) -> Self {
        snp.makeConstraints {
            if let width {
                $0.width.equalTo(width)
            }

            if let height {
                $0.height.equalTo(height)
            }
        }
        return self
    }
}

extension UIView: ViewLayoutable {}
