//
//  WhoofApp.swift
//  Whoof
//
//  Created by Suchith Nayaka on 31/05/22.
//

import SwiftUI

@main
struct WhoofApp: App {
    @StateObject private var userAuth = UserAuth()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userAuth)
        }
    }
}
