import UIKit

// MARK: - properties & init

final class SampleTextView: UIView {
    private var body: UIView {
        VStackView(alignment: .center) {
            UILabel().configure {
                $0.text = "Hello World!"
                $0.font = .systemFont(ofSize: .apply(base: 30))
            }
        }
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

private extension SampleTextView {
    func setupView() {
        configure {
            $0.addSubview(body) {
                $0.center.equalToSuperview()
            }

            $0.backgroundColor = .white
        }
    }
}

// MARK: - internal methods

extension SampleTextView {}

#if DEBUG
    import SwiftUI

    struct SampleTextViewPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: SampleTextView())
        }
    }
#endif
