//
//  SignupView.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import SwiftUI

struct SignUpView: View {
    @ObservedObject var signUpVM = SignUpViewModel()
    @EnvironmentObject var userAuth: UserAuth
    var body: some View {
        ZStack {
            VStack {
                VStack {
                    EntryField(placeHolder: "Name", prompt: signUpVM.namePrompt, field: $signUpVM.name)
                        .padding()
                    Divider()
                        .padding(.horizontal)
                    EntryField(placeHolder: "Email Address", prompt: signUpVM.emailPrompt, field: $signUpVM.email)
                        .padding()
                    Divider()
                        .padding(.horizontal)
                    EntryField(placeHolder: "Password", prompt: signUpVM.passwordPrompt, field: $signUpVM.password, isSecure: true)
                        .padding()
                }
                .background(Color.white)
                .cornerRadius(40)
                .padding()
                Spacer()
                Button {
                    userAuth.login()
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
