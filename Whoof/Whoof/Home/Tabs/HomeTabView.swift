//
//  HomeTabView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import SwiftUI

struct HomeTabView: View {
    
    @Binding var tabSelection: HomeView.WhoofTabs
    
    var body: some View {
        Text("Home")
    }
}