import SnapKit
import UIKit

final class SampleViewController: UIViewController {
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )

    private var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
            let section = SampleSection.allCases[sectionIndex]

            switch section {
            case .sample1:
                let configuration = UICollectionLayoutListConfiguration(appearance: .plain)

                return NSCollectionLayoutSection.list(
                    using: configuration,
                    layoutEnvironment: layoutEnvironment
                )

            case .sample2:
                let configuration = UICollectionLayoutListConfiguration(appearance: .plain)

                return NSCollectionLayoutSection.list(
                    using: configuration,
                    layoutEnvironment: layoutEnvironment
                )

            case .sample3:
                let configuration = UICollectionLayoutListConfiguration(appearance: .plain)

                return NSCollectionLayoutSection.list(
                    using: configuration,
                    layoutEnvironment: layoutEnvironment
                )
            }
        }
    }

    private var dataSource: UICollectionViewDiffableDataSource<
        SampleSection,
        SampleViewData.ID
    >?

    private let provider = SampleViewDataProvider()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
        configureDataSource()
        applySnapshot()
    }
}

// MARK: - private methods

private extension SampleViewController {
    func setupCollectionView() {
        view.addSubview(collectionView) {
            $0.edges.equalToSuperview()
        }
    }

    func configureDataSource() {
        let cellRegistration = CellRegistration<UICollectionViewListCell, SampleViewData> { cell, indexPath, viewData in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = "Title: \(viewData.title)"
            configuration.secondaryText = "IndexPath.Row: \(indexPath.row)"
            cell.contentConfiguration = configuration
        }

        dataSource = .init(collectionView: collectionView) { [weak self] collectionView, indexPath, id in
            let section = SampleSection.allCases[indexPath.section]
            let item = self?.provider.viewData(section: section, id: id)

            return collectionView.dequeueConfiguredReusableCell(
                using: cellRegistration,
                for: indexPath,
                item: item
            )
        }
    }

    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SampleSection, SampleViewData.ID>()
        snapshot.appendSections(SampleSection.allCases)
        snapshot.appendItems(SampleViewDataProvider.sample1.map(\.id), toSection: .sample1)
        snapshot.appendItems(SampleViewDataProvider.sample2.map(\.id), toSection: .sample2)
        snapshot.appendItems(SampleViewDataProvider.sample3.map(\.id), toSection: .sample3)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
