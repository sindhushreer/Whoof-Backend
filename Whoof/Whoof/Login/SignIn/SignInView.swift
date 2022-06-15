//
//  SignupView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import SwiftUI

struct SignInView: View {
    @ObservedObject var signInVM = SignInViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    EntryField(placeHolder: "Email Address", prompt: signInVM.emailPrompt, field: $signInVM.email)
                        .padding(.horizontal)
                    Divider()
                        .padding(.horizontal)
                    EntryField(placeHolder: "Password", prompt: signInVM.passwordPrompt, field: $signInVM.password, isSecure: true)
                        .padding([.bottom,.horizontal])
                }
                .padding()
                Spacer()
                Button {
                    
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
    }
}
