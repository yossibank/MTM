import Combine
import UIKit

// MARK: - properties & init

final class ___FILEBASENAME___: UICollectionViewCell {
    var cancellables = Set<AnyCancellable>()

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

// MARK: - override methods

extension ___FILEBASENAME___ {
    override func prepareForReuse() {
        super.prepareForReuse()

        cancellables.removeAll()
    }
}

// MARK: - private methods

private extension ___FILEBASENAME___ {
    func setupView() {
        contentView.configure {
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
