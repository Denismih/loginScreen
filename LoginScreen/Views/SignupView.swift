//
//  SignupView.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import SwiftUI

struct SignupView: View {
    @StateObject private var signupVM = SignupViewModel()
    @EnvironmentObject var authManager: AuthenticationManager
    var body: some View {
        VStack {
            Text("Sign up")
                .font(.largeTitle)
                .padding(.bottom, 40)
            TextField("User name", text: $signupVM.username)
                .keyboardType(.emailAddress)
                .foregroundColor(signupVM.usernameValid ? .green : .red)
            
            SecureField("Password", text: $signupVM.password)
            SecureField("Verify password", text: $signupVM.verifyPassword)
                .padding(.bottom, 20)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("● passwords in both text fields must match")
                    .foregroundColor(signupVM.passwordMatch ? .green : .red)
                Text("● password length greater than 8 chars")
                    .foregroundColor(signupVM.passwordLenghthAlowed ? .green : .red)
                Text("● the well-known passwords prohibited")
                    .foregroundColor(signupVM.notWellKnownPasswords ? .green : .red)
                Text("● the user name valid")
                    .foregroundColor(signupVM.usernameValid ? .green : .red)
            }
                .font(.body)
                .padding(.leading, 20)
            
            Button("Create Account") {
                authManager.updateAuthStatus(authenticated: true)
            }
            .disabled(!signupVM.sigupButtonEnabled)
            .padding(.top, 40)
            
            Spacer()
        }
        .autocapitalization(.none)
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding()
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
