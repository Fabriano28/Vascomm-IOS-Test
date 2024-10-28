//
//  RegisterRouter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation
import UIKit

protocol RegisterRouterInterface: AnyObject {
    func navigateToLogin()
    func navigateToHome()
}

class RegisterRouter: RegisterRouterInterface {
    static func createRegisterModule() -> UIViewController {
        let registerViewController = RegisterViewController()
        let registerPresenter = RegisterPresenter()
        let registerInteractor = RegisterInteractor()
        let router = RegisterRouter()
        
        registerViewController.registerPresenter = registerPresenter
        registerPresenter.view = registerViewController
        registerPresenter.interactor = registerInteractor
        registerPresenter.router = router
            
        return registerViewController
    }
    
    func navigateToLogin() {
        print("navigating")
        if let navigationController = UIApplication.shared.keyWindow?.rootViewController as? UINavigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    func navigateToHome() {
    }
    
    
}
