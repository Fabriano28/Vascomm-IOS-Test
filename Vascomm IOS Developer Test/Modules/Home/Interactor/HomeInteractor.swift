//
//  HomeInteractor.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import Foundation

protocol HomeInteractorInterface: AnyObject {
    func fetchProducts()
    func fetchServices()
}

class HomeInteractor: HomeInteractorInterface {
    
    weak var output: HomeInteractorOutput?
    
    func fetchProducts() {
        
        let mockProducts = ProductsMockData.products
        var fetchSuccess: Bool = false
        
        if !mockProducts.isEmpty {
            fetchSuccess = true
        }
        
        if fetchSuccess {
            output?.didFetchProducts(mockProducts)
        } else {
            output?.didFailToFetchProducts(with: ProductsError.invalidData)
        }
    }
    
    func fetchServices() {
        let mockServices = ServicesMockData.services
        var fetchSuccess: Bool = false
        
        if !mockServices.isEmpty {
            fetchSuccess = true
        }
        
        if fetchSuccess {
            output?.didFetchServices(mockServices)
        } else {
            output?.didFailToFetchServices(with: ServicesError.invalidData)
        }
    }
    
}
