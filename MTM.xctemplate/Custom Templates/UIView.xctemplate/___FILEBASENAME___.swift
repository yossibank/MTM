import UIKit

// MARK: - properties & init

final class ___FILEBASENAME___: UIView {
    private var body: UIView {
        VStackView(alignment: .center) {
            UILabel().configure {
                $0.text = "Hello World!"
            }

            label
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

private extension ___FILEBASENAME___ {
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

extension ___FILEBASENAME___ {}

// MARK: - preview

#if DEBUG
    import SwiftUI

    struct ___FILEBASENAME___Preview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: ___FILEBASENAME___())
        }
    }
#endif
