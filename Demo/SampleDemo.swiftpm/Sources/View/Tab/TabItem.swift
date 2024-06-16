import UIKit

enum TabItem: Int, CaseIterable {
    case sample1
    case sample2
    case sample3

    var rootViewController: UIViewController {
        let rootViewController = UINavigationController(
            rootViewController: baseViewController
        )

        rootViewController.tabBarItem = .init(
            title: title,
            image: image?
                .resized(size: .init(width: 24, height: 24))
                .withRenderingMode(.alwaysOriginal),
            tag: rawValue
        )

        return rootViewController
    }

    private var title: String {
        switch self {
        case .sample1: "sample1"
        case .sample2: "sample2"
        case .sample3: "sample3"
        }
    }

    private var image: UIImage? {
        switch self {
        case .sample1: .init(systemName: "a.square")
        case .sample2: .init(systemName: "b.square")
        case .sample3: .init(systemName: "c.square")
        }
    }

    private var baseViewController: UIViewController {
        switch self {
        case .sample1: Sample1ViewController()
        case .sample2: Sample2ViewController()
        case .sample3: Sample3ViewController()
        }
    }
}
