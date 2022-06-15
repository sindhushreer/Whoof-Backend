//
//  ContentView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 31/05/22.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        if !userAuth.isLoggedIn {
            NavigationView {
                LoginView()
            }
        }
        else {
            HomeView()
        }
    }
}
