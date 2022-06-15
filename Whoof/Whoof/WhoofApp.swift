//
//  WhoofApp.swift
//  Whoof
//
//  Created by Suchith Nayaka on 31/05/22.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
content_copy

    return true
  }
}

@main
struct WhoofApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var userAuth = UserAuth()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
        }
    }
}
