//
//  LoginRouter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation
import UIKit

protocol LoginRouterInterface {
    func navigateToHome(from view: LoginViewInterface)
    func navigateToRegister(from view: LoginViewInterface)
}

class LoginRouter: LoginRouterInterface {
    weak var viewController: UIViewController?
    
    func navigateToHome(from view: LoginViewInterface) {
        
        print("navigating")
        let homeViewController = HomeRouter.createHomeModule()
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(homeViewController, animated: true)
        }
    }
    
    func navigateToRegister(from view: LoginViewInterface) {
        let registerViewController = RegisterRouter.createRegisterModule()
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(registerViewController, animated: true)
        }
    }
    
    func createRouterModule() -> UIViewController {
        let viewController = LoginViewController()
        let presenter = LoginPresenter()
        let interactor = LoginInteractor()
        let router = self
        
        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        
        return viewController
    }
}
