import SwiftUI
import UIKit

final class SampleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
    }
}

struct UIViewControllerWrapper<T: UIViewController>: UIViewControllerRepresentable {
    let viewController: T

    func makeUIViewController(context: Context) -> T {
        viewController
    }

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}
}
