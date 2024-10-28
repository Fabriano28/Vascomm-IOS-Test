//
//  HomePresenter.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
}

protocol HomeInteractorOutput: AnyObject {
    func didFetchProducts(_ products: [Product])
    func didFailToFetchProducts(with error: ProductsError)
    func didFetchServices(_ services: [Service])
    func didFailToFetchServices(with error: ServicesError)
}

class HomePresenter: HomePresenterInterface, HomeInteractorOutput {
    
    weak var homeView: HomeViewInterface?
    var homeInteractor: HomeInteractor?
    
    func viewDidLoad() {
        homeInteractor?.fetchProducts()
    }
    
    func didFetchProducts(_ products: [Product]) {
        homeView?.displayProductData(products)
    }
    
    func didFailToFetchProducts(with error: ProductsError) {
        switch error {
            case .invalidResponse:
                print("Invalid response")
            case .invalidData:
                print("Invalid data")
            case .unknownError:
                print("Unknown error")
        }
    }
    
    func didFetchServices(_ services: [Service]) {
        homeView?.displayServiceData(services)
    }
    
    func didFailToFetchServices(with error: ServicesError) {
        switch error {
            case .invalidResponse
                : print("Invalid response")
            case .invalidData
                : print("Invalid data")
            case .unknownError
                : print("Unknown error")
        }
    }
    
    
}
