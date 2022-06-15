//
//  Common.swift
//  Whoof
//
//  Created by Suchith Nayaka on 15/06/22.
//

import Foundation


class CommonData {
    static var sharedVariables = SharedVariables()
}
class SharedVariables: ObservableObject {
    var isLoggedIn: Bool {
        set {
            UserDefaults.standard.set(newValue, forKey: "isLoggedIn")
        } get {
            return UserDefaults.standard.bool(forKey: "isLoggedIn") 
        }
    }
}
