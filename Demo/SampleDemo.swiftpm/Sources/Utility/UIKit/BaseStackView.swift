import UIKit

class BaseStackView: UIStackView {
    init(
        axis: NSLayoutConstraint.Axis,
        alignment: UIStackView.Alignment,
        distribution: UIStackView.Distribution,
        spacing: CGFloat,
        layoutMargins: UIEdgeInsets,
        arrangedSubviews: [UIView]
    ) {
        super.init(frame: .zero)

        self.axis = axis
        self.alignment = alignment
        self.distribution = distribution
        self.spacing = spacing
        self.isLayoutMarginsRelativeArrangement = true
        self.layoutMargins = layoutMargins

        for arrangedSubview in arrangedSubviews {
            addArrangedSubview(arrangedSubview)
        }
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
}
