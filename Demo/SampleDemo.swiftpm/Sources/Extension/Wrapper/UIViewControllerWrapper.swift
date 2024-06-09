import SwiftUI

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
