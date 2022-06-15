//
//  UserAuth.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation
import Combine

class UserAuth: ObservableObject {
    
    let didChange = PassthroughSubject<UserAuth, Never>()
    
    
    
    func login() {
        DispatchQueue.main.async {
            self.isLoggedIn = true
        }
        
    }
    
    @Published var isLoggedIn: Bool = UserDefaults.standard.bool(forKey: "userLoggedIn") {
        didSet {
            didChange.send(self)
            UserDefaults.standard.set(isLoggedIn, forKey: "userLoggedIn")
        }
    }
}
