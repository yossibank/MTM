import Combine
import UIKit

// MARK: - properties & init

final class SampleCell: UICollectionViewCell {
    var cancellables = Set<AnyCancellable>()

    private var body: UIView {
        VStackView(
            alignment: .center,
            spacing: .apply(base: 4)
        ) {
            titleLabel
            subTitleLabel
        }
    }

    private let titleLabel = UILabel().configure {
        $0.font = .boldSystemFont(ofSize: .apply(base: 20))
    }

    private let subTitleLabel = UILabel().configure {
        $0.font = .systemFont(ofSize: .apply(base: 12))
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

extension SampleCell {
    override func prepareForReuse() {
        super.prepareForReuse()

        cancellables.removeAll()
    }
}

// MARK: - private methods

private extension SampleCell {
    func setupView() {
        contentView.configure {
            $0.addSubview(body) {
                $0.center.equalToSuperview()
            }

            $0.backgroundColor = .green
        }
    }
}

// MARK: - internal methods

extension SampleCell {
    func configure(row: Int) {
        titleLabel.text = "Title: \(row)"
        subTitleLabel.text = "IndexPath.Row: \(row)"
    }
}

// MARK: - preview

#if DEBUG
    import SwiftUI

    struct SampleCellPreview: PreviewProvider {
        static var previews: some View {
            WrapperView(view: SampleCell()) {
                $0.configure(row: 1)
            }
            .size((DeviceSize.width - 2) / 3)
        }
    }
#endif
