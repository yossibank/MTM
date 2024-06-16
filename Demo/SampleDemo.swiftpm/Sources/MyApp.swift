import SwiftUI
import UIKit

@main
struct MyApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    var body: some Scene {
        WindowGroup {
            UIViewControllerWrapper(
                viewController: TabBarController()
            )
        }
    }
}

final class AppDelegate: NSObject, UIApplicationDelegate, ViewStylable {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureAppearance()
        return true
    }
}
