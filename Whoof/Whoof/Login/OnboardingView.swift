//
//  OnboardingView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 11/06/22.
//

import Foundation
import SwiftUI

struct OnboardingView: View {
    @State var selectedIndex: Int = 0
    @ObservedObject var OnboardingVM = OnboardingViewModel()
    var body: some View {
        ZStack(alignment: .top) {
            Color(hex: "#F1F0F2")
                .ignoresSafeArea()
            Color(hex: "#8A56AC")
                .frame(height: 300)
                .cornerRadius(radius: 100, corners: .bottomLeft)
            VStack {
                SegmentsView(selectedIndex: $selectedIndex, segments: ["Sign-in","Sign-up"])
                    .padding()
                if selectedIndex == 0 {
                    SignInView()
                }
                else if selectedIndex == 1 {
                    SignUpView()
                }
            }
        }
        .navigationBarHidden(true)
    }
}
