import UIKit

// MARK: - properties & init

final class CustomView: UIView {
    private var body: UIView {
        VStackView(alignment: .center) {
            UILabel().configure {
                $0.text = "Hello World!"
            }

            label

            UISpacer()
                .height(10)
        }
    }

    private let label = UILabel().configure {
        $0.text = "hello world!"
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - private methods

private extension CustomView {
    func setupView() {
        configure {
            $0.addSubview(body) {
                $0.horizontalEdges.centerY.equalToSuperview()
            }

            $0.backgroundColor = .red
        }
    }
}

// MARK: - internal methods

extension CustomView {}

// MARK: - preview

#if DEBUG
    import SwiftUI

    @available(iOS 17.0, *)
    #Preview(traits: .sizeThatFitsLayout) {
        CustomView()
            .size(width: .deviceWidth, height: 200)
    }

    struct CustomViewPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: CustomView())
        }
    }
#endif
