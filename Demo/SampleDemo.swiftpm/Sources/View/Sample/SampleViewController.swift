import SnapKit
import UIKit

final class SampleViewController: UIViewController {
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )

    private var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self else {
                return nil
            }

            let section = SampleSection.allCases[sectionIndex]

            switch section {
            case .sample1:
                return NSCollectionLayoutSection.list(
                    using: layoutListConfiguration(),
                    layoutEnvironment: layoutEnvironment
                )

            case .sample2:
                return NSCollectionLayoutSection.list(
                    using: layoutListConfiguration(),
                    layoutEnvironment: layoutEnvironment
                )

            case .sample3:
                return NSCollectionLayoutSection.list(
                    using: layoutListConfiguration(),
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
        let cellRegistration = CellRegistration<
            UICollectionViewListCell,
            SampleViewData
        > { cell, indexPath, viewData in
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

        let headerRegistration = HeaderRegistration<UICollectionViewListCell>(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { view, _, indexPath in
            let section = SampleSection.allCases[indexPath.section]
            var configuration = view.defaultContentConfiguration()
            configuration.text = section.title
            view.contentConfiguration = configuration
        }

        dataSource?.supplementaryViewProvider = { collectionView, _, indexPath in
            collectionView.dequeueConfiguredReusableSupplementary(
                using: headerRegistration,
                for: indexPath
            )
        }
    }

    func layoutListConfiguration() -> UICollectionLayoutListConfiguration {
        var configuration = UICollectionLayoutListConfiguration(appearance: .plain)

        configuration.trailingSwipeActionsConfigurationProvider = { indexPath in
            let deleteAction = UIContextualAction(
                style: .destructive,
                title: "削除"
            ) { [weak self] _, _, completion in
                guard
                    let self,
                    let id = dataSource?.itemIdentifier(for: indexPath)
                else {
                    completion(false)
                    return
                }

                let section = SampleSection.allCases[indexPath.section]
                provider.delete(section: section, id: id)
                applySnapshot()
                completion(true)
            }

            return UISwipeActionsConfiguration(actions: [deleteAction])
        }

        configuration.headerMode = .supplementary

        return configuration
    }

    func applySnapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<SampleSection, SampleViewData.ID>()
        snapshot.appendSections(SampleSection.allCases)
        snapshot.appendItems(provider.sample1.map(\.id), toSection: .sample1)
        snapshot.appendItems(provider.sample2.map(\.id), toSection: .sample2)
        snapshot.appendItems(provider.sample3.map(\.id), toSection: .sample3)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}
