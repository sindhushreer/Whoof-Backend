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
    @ObservedObject var homeTabVM = HomeTabViewModel()
    var body: some View {
        ZStack {
            Color.tabSelected
            VStack {
                HStack {
                    Button {
                        homeTabVM.feedFood()
                    } label: {
                        VStack(alignment: .leading) {
                            Text("Feed your\n Dog!")
                                .foregroundColor(.tabSelected)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            HStack {
                                Text("2/3 times done")
                                    .foregroundColor(.tabSelected)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .opacity(0.5)
                                    .padding()
                                CustomProgressView(progress: 0.66)
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                        }
                        .background(Color(hex: "#9599B3"))
                        .cornerRadius(radius: 10, corners: [.topLeft,.bottomRight])
                        .cornerRadius(radius: 40, corners: [.topRight,.bottomLeft])
                    }
                    .padding(.vertical)
                    .padding(.leading)
                    .shadow(color: Color(hex: "#00000029"), radius: 10, x: 0, y: 10)
                    Button {
                        
                    } label: {
                        VStack(alignment: .leading) {
                            Text("Feed some\n Water")
                                .foregroundColor(.tabSelected)
                                .font(.system(size: 16))
                                .fontWeight(.bold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            HStack {
                                Text("3/5 times done")
                                    .foregroundColor(.tabSelected)
                                    .font(.system(size: 12))
                                    .fontWeight(.regular)
                                    .opacity(0.5)
                                    .padding()
                                CustomProgressView(progress: 0.6)
                                    .frame(width: 20, height: 20)
                                    .padding()
                            }
                        }
                        .background(Color(hex: "#8A56AC"))
                        .cornerRadius(radius: 10, corners: [.topLeft,.bottomRight])
                        .cornerRadius(radius: 40, corners: [.topRight,.bottomLeft])
                    }
                    .padding(.vertical)
                    .padding(.trailing)
                    .shadow(color: Color(hex: "#00000029"), radius: 10, x: 0, y: 10)
                }
            }
        }
    }
}
