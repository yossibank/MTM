import UIKit

typealias VoidBlock = () -> Void

typealias CellRegistration<
    Cell: UICollectionViewCell,
    ViewData
> = UICollectionView.CellRegistration<Cell, ViewData>

typealias HeaderRegistration<
    Cell: UICollectionViewCell
> = UICollectionView.SupplementaryRegistration<Cell>
