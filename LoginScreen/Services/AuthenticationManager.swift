//
//  AuthenticationManager.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import SwiftUI

class AuthenticationManager: ObservableObject {
   
    @Published var isAuthenticated = false
    
    func updateAuthStatus(authenticated: Bool) {
        withAnimation {
            isAuthenticated = authenticated
        }
    }
}
