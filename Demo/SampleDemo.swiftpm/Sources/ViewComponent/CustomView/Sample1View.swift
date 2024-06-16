import UIKit

// MARK: - properties & init

final class Sample1View: UIView {
    private var body: UIView {
        VStackView(alignment: .center) {
            UILabel().configure {
                $0.text = "text"
                $0.font = .systemFont(ofSize: .apply(base: 30))
            }

            label
        }
    }

    private let label = UILabel().configure {
        $0.text = "sub text"
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

private extension Sample1View {
    func setupView() {
        configure {
            $0.addSubview(body) {
                $0.edges.equalToSuperview()
            }

            $0.backgroundColor = .white
        }
    }
}

// MARK: - internal methods

extension Sample1View {}

// MARK: - preview

#if DEBUG
    import SwiftUI

    @available(iOS 17.0, *)
    #Preview(traits: .sizeThatFitsLayout) {
        Sample1View()
    }

    struct Sample1ViewPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: Sample1View())
        }
    }
#endif
