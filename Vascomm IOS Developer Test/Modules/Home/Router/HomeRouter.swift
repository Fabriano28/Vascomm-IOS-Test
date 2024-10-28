//
//  HomeRouter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import Foundation
import UIKit

class HomeRouter {
    weak var view: HomeViewInterface?
    
    static func createHomeModule() -> UIViewController {
        let homeViewController = HomeViewController()
        let homePresenter = HomePresenter()
        let homeInteractor = HomeInteractor()
        
        homeViewController.homePresenter = homePresenter
        homePresenter.homeView = homeViewController
        homePresenter.homeInteractor = homeInteractor
        homeInteractor.output = homePresenter
        
        return homeViewController
    }
}
