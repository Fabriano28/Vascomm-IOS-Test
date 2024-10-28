//
//  LoginPresenter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation

protocol LoginPresenterInterface {
    func login(with email: String, password: String)
    func didLoginSuccessfully(response: LoginResponse)
    func didTapRegisterButton()
}

class LoginPresenter: LoginPresenterInterface {
    weak var view: LoginViewInterface?
    var interactor: LoginInteractorInterface?
    var router: LoginRouterInterface?
    
    func login(with email: String, password: String) {
        view?.showLoading()
        let request = LoginRequest(email: email, password: password)
        interactor?.performLogin(with: request)
    }
    
    func didLoginSuccessfully(response: LoginResponse) {
        if response.token.isEmpty {
            print("empty")
        } else {
            print(response)
            router?.navigateToHome(from: view!)
        }
    }
    
    func didTapRegisterButton() {
        print("tapped register")
        router?.navigateToRegister(from: view!)
    }
}
