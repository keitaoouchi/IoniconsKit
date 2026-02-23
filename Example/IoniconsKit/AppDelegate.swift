import UIKit
import SwiftUI
import IoniconsKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        // UIKit tab (from Storyboard)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let uikitNav = storyboard.instantiateInitialViewController()!
        uikitNav.tabBarItem = UITabBarItem(
            title: "UIKit",
            image: UIImage(systemName: "list.bullet"),
            tag: 0
        )

        // SwiftUI tab
        let hostingController = UIHostingController(rootView: IoniconsSwiftUIView())
        hostingController.tabBarItem = UITabBarItem(
            title: "SwiftUI",
            image: UIImage(systemName: "swift"),
            tag: 1
        )

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = [uikitNav, hostingController]

        window.rootViewController = tabBarController
        window.makeKeyAndVisible()
        self.window = window

        return true
    }
}

