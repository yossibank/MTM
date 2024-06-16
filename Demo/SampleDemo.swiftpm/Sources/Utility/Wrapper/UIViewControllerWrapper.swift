import SwiftUI

struct UIViewControllerWrapper<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    func makeUIViewController(context: Context) -> ViewController {
        viewController
    }

    func updateUIViewController(
        _ uiViewController: UIViewControllerType,
        context: Context
    ) {}
}
