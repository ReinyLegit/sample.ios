//
//  sample_iosApp.swift
//  Shared
//
//  Created by Eric Vidana on 5/12/21.
//

import SwiftUI
import Firebase
import FirebaseAnalytics

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
            [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        Analytics.logEvent("hi_adsf", parameters: [
                            "test":"true"])
        return true
      }
}

@main
struct sample_iosApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
