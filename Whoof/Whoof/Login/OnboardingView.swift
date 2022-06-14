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
                VStack {
                    EntryField(placeHolder: "Email Address", prompt: OnboardingVM.emailPrompt, field: $OnboardingVM.email)
                        .padding()
                    Divider()
                        .padding(.horizontal)
                    EntryField(placeHolder: "Password", prompt: OnboardingVM.passwordPrompt, field: $OnboardingVM.password, isSecure: true)
                        .padding()
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding()
                Button {
                    OnboardingVM.getData()
                } label: {
                    Text("Contiue")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .textCase(.uppercase)
                        .padding()
                }
                .frame(maxWidth: UIScreen.main.bounds.width - 30)
                .background(Color(hex: "#8A56AC"))
                .cornerRadius(40)
                .padding()
            }
        }
        .navigationBarHidden(true)
    }
}
