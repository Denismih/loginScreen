//
//  SignupViewModel.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import Combine
import Foundation

class SignupViewModel: ObservableObject {
    
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var verifyPassword: String = ""
    
    @Published var usernameValid = false
    private var cancellableSet: Set<AnyCancellable> = []
    
    //check passwords match
    var passwordMatch: Bool {
        password == verifyPassword && !password.isEmpty
    }
    //check passwords lenght
    var passwordLenghthAlowed: Bool {
        password.count > 8
    }
    // check password is not well-known
    var notWellKnownPasswords: Bool {
        password != "password" && password != "admin"
    }
    // check username available
    var usernameValidationPublisher: AnyPublisher<Bool, Never> {
        return $username
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .flatMap { username in
                return Future { promise in
                    APIService.shared.usernameAvailable(username) { available in
                        promise(.success(available))
                    }
                }
            }
            .eraseToAnyPublisher()
    }
    //final check to enable signup button
    var sigupButtonEnabled: Bool {
        passwordMatch && passwordLenghthAlowed && notWellKnownPasswords && usernameValid
    }
    
    init() {
        usernameValidationPublisher
            .receive(on: RunLoop.main)
            .assign(to: \.usernameValid, on: self)
            .store(in: &cancellableSet)
    }
}
