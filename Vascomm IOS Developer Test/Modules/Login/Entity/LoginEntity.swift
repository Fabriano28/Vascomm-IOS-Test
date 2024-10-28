//
//  LoginEntity.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation

struct LoginRequest {
    let email: String
    let password: String
}

struct LoginResponse: Codable {
    let token: String
}
