//
//  RegisterPresenter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation

protocol RegisterPresenterInterface: AnyObject {
    func register()
    func didTapLoginButton()
}

class RegisterPresenter: RegisterPresenterInterface, RegisterInteractorOutputInterface {
    var view: RegisterViewInterface?
    var interactor: RegisterInteractorInterface?
    var router: RegisterRouterInterface?
    
    func register() {
        
    }
    
    func didTapLoginButton() {
        print("forward to router")
        router?.navigateToLogin()
    }
}
