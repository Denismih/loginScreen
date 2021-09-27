//
//  APIService.swift
//  LoginScreen
//
//  Created by denis mikhaylovsky on 26.09.2021.
//

import Foundation

class APIService {
    static let shared = APIService()
    
    func usernameAvailable(_ username: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 0.5) {
            if username.count < 5 {
                completion(false)
            } else {
                completion(true)
            }
        } 
    }
}
