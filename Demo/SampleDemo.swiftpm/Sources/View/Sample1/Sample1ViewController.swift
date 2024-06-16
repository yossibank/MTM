import SnapKit
import UIKit

// MARK: - properties & init

final class Sample1ViewController: UIViewController {
    private lazy var collectionView: UICollectionView = .init(
        frame: .zero,
        collectionViewLayout: collectionViewLayout
    )

    private var collectionViewLayout: UICollectionViewLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
            guard let self else {
                return nil
            }

            let section = Sample1Section.allCases[sectionIndex]

            switch section {
            case .sample1:
                return NSCollectionLayoutSection.list(
                    using: layoutListConfiguration(),
                    layoutEnvironment: layoutEnvironment
                )

            case .sample3:
                return NSCollectionLayoutSection.list(
                    using: layoutListConfiguration(),
                    layoutEnvironment: layoutEnvironment
                )

            case .sample2:
                let itemSize = (collectionView.bounds.width - 2) / 3
                let item = NSCollectionLayoutItem(
                    layoutSize: .init(
                        widthDimension: .absolute(itemSize),
                        heightDimension: .absolute(itemSize)
                    )
                )

                let items = NSCollectionLayoutGroup.horizontal(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .fractionalHeight(1.0)
                    ),
                    subitem: item,
                    count: 3
                )
                items.interItemSpacing = .fixed(1)

                let group = NSCollectionLayoutGroup.vertical(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(itemSize)
                    ),
                    subitems: [items]
                )

                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: .init(
                        widthDimension: .fractionalWidth(1.0),
                        heightDimension: .absolute(28)
                    ),
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .top
                )
                header.pinToVisibleBounds = true

                let section = NSCollectionLayoutSection(group: group)
                section.interGroupSpacing = 1
                section.boundarySupplementaryItems = [header]
                return section
            }
        }
    }

    private var dataSource: UICollectionViewDiffableDataSource<
        Sample1Section,
        Sample1ViewData.ID
    >?

    private let provider = Sample1ViewDataProvider()
}

// MARK: - override methods

extension Sample1ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setupCollectionView()
        configureDataSource()
        applySnapshot()
    }
}

// MARK: - private methods

private extension Sample1ViewController {
    func setupView() {
        title = "sample1"
    }

    func setupCollectionView() {
        view.addSubview(collectionView) {
            $0.edges.equalToSuperview()
        }
    }

    func configureDataSource() {
        let cellRegistration = CellRegistration<
            UICollectionViewListCell,
            Sample1ViewData
        > { cell, indexPath, viewData in
            var configuration = cell.defaultContentConfiguration()
            configuration.text = "Title: \(viewData.title)"
            configuration.secondaryText = "IndexPath.Row: \(indexPath.row)"
            cell.contentConfiguration = configuration
        }

        let sampleCellRegistration = CellRegistration<
            SampleCell,
            Sample1ViewData
        > { cell, indexPath, _ in
            cell.configure(row: indexPath.row)
        }

        dataSource = .init(collectionView: collectionView) { [weak self] collectionView, indexPath, id in
            let section = Sample1Section.allCases[indexPath.section]
            let item = self?.provider.viewData(section: section, id: id)

            switch section {
            case .sample1, .sample3:
                return collectionView.dequeueConfiguredReusableCell(
                    using: cellRegistration,
                    for: indexPath,
                    item: item
                )

            case .sample2:
                return collectionView.dequeueConfiguredReusableCell(
                    using: sampleCellRegistration,
                    for: indexPath,
                    item: item
                )
            }
        }

        let headerRegistration = HeaderRegistration<UICollectionViewListCell>(
            elementKind: UICollectionView.elementKindSectionHeader
        ) { view, _, indexPath in
            let section = Sample1Section.allCases[indexPath.section]
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

                let section = Sample1Section.allCases[indexPath.section]
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
        var snapshot = NSDiffableDataSourceSnapshot<Sample1Section, Sample1ViewData.ID>()
        snapshot.appendSections(Sample1Section.allCases)
        snapshot.appendItems(provider.sample1.map(\.id), toSection: .sample1)
        snapshot.appendItems(provider.sample2.map(\.id), toSection: .sample2)
        snapshot.appendItems(provider.sample3.map(\.id), toSection: .sample3)
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
}

#if DEBUG
    @available(iOS 17.0, *)
    #Preview {
        Sample1ViewController()
    }
#endif
