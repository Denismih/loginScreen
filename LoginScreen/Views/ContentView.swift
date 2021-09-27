//
//  ContentView.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View {
        VStack{
            Text("Account created")
                .padding()
            Button("Log out") {
                authManager.updateAuthStatus(authenticated: false)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
