import UIKit

// MARK: - properties & init

final class Sample2View: UIView {
    private var body: UIView {
        VStackView(alignment: .center) {
            UILabel().configure {
                $0.text = "Hello World!"
                $0.font = .systemFont(ofSize: .apply(base: 30))
            }

            label
        }
    }

    private let label = UILabel().configure {
        $0.text = "hello world!"
        $0.font = .systemFont(ofSize: .apply(base: 15))
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

private extension Sample2View {
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

extension Sample2View {}

// MARK: - preview

#if DEBUG
    import SwiftUI

    struct CustomViewPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: Sample2View())
        }
    }
#endif
