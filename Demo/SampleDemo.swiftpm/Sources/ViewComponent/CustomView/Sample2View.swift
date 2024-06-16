import UIKit

// MARK: - properties & init

final class Sample2View: UIView {
    private var body: UIView {
        VStackView(alignment: .center, spacing: 8) {
            UILabel().configure {
                $0.text = "Hello World!"
                $0.font = .systemFont(ofSize: .apply(base: 30))
            }

            label

            UIImageView()
                .configure {
                    $0.image = .init(systemName: "swift")
                }
                .addConstraint {
                    $0.size.equalTo(100 * DeviceSize.sizeRatio)
                }
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
                $0.edges.equalToSuperview()
            }

            $0.backgroundColor = .blue
        }
    }
}

// MARK: - internal methods

extension Sample2View {}

// MARK: - preview

#if DEBUG
    import SwiftUI

    @available(iOS 17.0, *)
    #Preview(traits: .sizeThatFitsLayout) {
        Sample2View()
    }

    struct Sample2ViewPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: Sample2View())
        }
    }
#endif
