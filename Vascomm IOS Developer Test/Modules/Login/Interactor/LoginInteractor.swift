//
//  LoginInteractor.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation

protocol LoginInteractorInterface {
    func performLogin(with request: LoginRequest)
}

class LoginInteractor: LoginInteractorInterface {
    var presenter: LoginPresenterInterface?
    
    func performLogin(with request: LoginRequest) {
        guard let url = URL(string: "https://reqres.in/api/login") else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        print(request)
        
        let parameters = ["email": request.email, "password": request.password]
        
        urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
        
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            guard let data = data, error == nil else { return }
            
            print("requesting data")
            
            do {
                let loginResponse = try JSONDecoder().decode(LoginResponse.self, from: data)
                
                print(loginResponse.token)
                
                DispatchQueue.main.async {
                    self.presenter?.didLoginSuccessfully(response: loginResponse)
                }
            } catch {
                
            }
        }
        task.resume()
    }
}
