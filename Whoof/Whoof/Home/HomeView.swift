//
//  HomeView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import SwiftUI

struct HomeView: View {
    enum WhoofTabs: String {
        case analytics
        case home
        case profile
    }
    
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.tabUnselected
    }
    
    @State var selectedTab: WhoofTabs = .home
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedTab) {
                AnaylticsView(tabSelection: $selectedTab)
                    .tabItem {
                        Image("Analytics")
                        Text("Analytics")
                    }
                    .tag(WhoofTabs.analytics)
                HomeTabView(tabSelection: $selectedTab)
                    .tabItem {
                        Image("Home")
                        Text("Home")
                    }
                    .tag(WhoofTabs.home)
                ProfileView(tabSelection: $selectedTab)
                    .tabItem {
                        Image("Profile")
                        Text("Profile")
                    }
                    .tag(WhoofTabs.profile)
            }
            .onAppear {
                selectedTab = .home
            }
        }
        .accentColor(.tabSelected)
    }
}
