//
//  OnBoardingViewModel.swift
//  Whoof
//
//  Created by Suchith Nayaka on 11/06/22.
//

import Foundation
import Combine

class OnboardingViewModel: ObservableObject {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    
    var subscriptions = Set<AnyCancellable>()
    let service = WhoofService()
    
    var passwordPrompt: String {
        return ""
    }
    
    var namePrompt: String {
        return ""
    }
    
    var emailPrompt: String {
        if isEmailValid() {
            return ""
        } else {
            return ""
        }
    }
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@",
                                    "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\\]?)$")
        return emailTest.evaluate(with: email)
    }
}
