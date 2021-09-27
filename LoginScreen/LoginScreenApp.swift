//
//  LoginScreenApp.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import SwiftUI

@main
struct LoginScreenApp: App {
    @StateObject var authManager = AuthenticationManager()
    var body: some Scene {
        WindowGroup {
            if authManager.isAuthenticated {
                ContentView()
                    .environmentObject(authManager)
            } else {
                SignupView()
                    .environmentObject(authManager)
            }
        }
    }
}
