import SwiftUI

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            UIViewControllerWrapper(
                viewController: SampleViewController()
            )
        }
    }
}
