//
//  HomeViewController.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

protocol HomeViewInterface: AnyObject {
    func displayProductData(_ productData: [Product])
    func displayServiceData(_ serviceData: [Service])
}

class HomeViewController: UIViewController, HomeViewInterface {
    
    var homeCollectionView: UICollectionView!
    var homePresenter: HomePresenterInterface?
    
    func displayProductData(_ productData: [Product]) {
        
    }
    
    func displayServiceData(_ serviceData: [Service]) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavigationBar()
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        homeCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        homeCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        // Headers
        homeCollectionView.register(SectionHeaderReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier)
        
        // Cells
        homeCollectionView.register(SectionOneCollectionViewCell.self, forCellWithReuseIdentifier: "SectionOneCell")
        homeCollectionView.register(SectionTwoCollectionViewCell.self, forCellWithReuseIdentifier: "SectionTwoCell")
        homeCollectionView.register(SectionThreeCollectionViewCell.self, forCellWithReuseIdentifier: "SectionThreeCell")
        homeCollectionView.register(ProductCollectionViewCell.self, forCellWithReuseIdentifier: "ProductCell")
        homeCollectionView.register(ServiceCollectionViewCell.self, forCellWithReuseIdentifier: "ServiceCell")
        
        homeCollectionView.dataSource = self
        homeCollectionView.delegate = self
        
        view.addSubview(homeCollectionView)
        
        NSLayoutConstraint.activate([
            homeCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            homeCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    func setupNavigationBar() {
        self.title = "Home"
        
        let hamburgerButton = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3"), style: .plain, target: self, action: #selector(hamburgerButtonTapped))
        self.navigationItem.leftBarButtonItem = hamburgerButton
        
        let cartButton = UIBarButtonItem(image: UIImage(systemName: "cart"), style: .plain, target: self, action: #selector(cartButtonTapped))
        
        let bellButton = UIBarButtonItem(image: UIImage(systemName: "bell"), style: .plain, target: self, action: #selector(bellButtonTapped))
        
        self.navigationItem.rightBarButtonItems = [cartButton, bellButton]
    }
    
    @objc private func hamburgerButtonTapped() {
        let sideMenuViewController = SideMenuViewController()
        sideMenuViewController.modalPresentationStyle = .overCurrentContext
        sideMenuViewController.modalTransitionStyle = .crossDissolve
        present(sideMenuViewController, animated: true, completion: nil)
    }
    
    @objc private func cartButtonTapped() {
        print("cart button tapped")
    }
    
    @objc private func bellButtonTapped() {
        print("bell button tapped")
    }

}

extension HomeViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
            case 0:
                return 1
            case 1:
                return 1
            case 2:
                return 1
            case 3:
                return ProductsMockData.products.count
            case 4:
                return ServicesMockData.services.count
            default:
                return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        switch indexPath.section {
        case 0:
            guard let sectionOneCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SectionOneCell", for: indexPath) as? SectionOneCollectionViewCell else {
                return UICollectionViewCell() }
            return sectionOneCell
        case 1:
            guard let sectionTwoCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SectionTwoCell", for: indexPath) as? SectionTwoCollectionViewCell else {
                return UICollectionViewCell() }
            return sectionTwoCell
        case 2:
            guard let sectionThreeCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "SectionThreeCell", for: indexPath) as? SectionThreeCollectionViewCell else {
                return UICollectionViewCell() }
            return sectionThreeCell
        case 3:
            guard let productCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as? ProductCollectionViewCell else {
                return UICollectionViewCell()
            }
            let product = ProductsMockData.products[indexPath.item]
            productCell.configure(with: product)
            return productCell
        case 4:
            guard let serviceCell = homeCollectionView.dequeueReusableCell(withReuseIdentifier: "ServiceCell", for: indexPath) as? ServiceCollectionViewCell else {
                return UICollectionViewCell()
            }
            let service = ServicesMockData.services[indexPath.item]
            serviceCell.configure(with: service)
            return serviceCell
        default:
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderReusableView.reuseIdentifier, for: indexPath) as! SectionHeaderReusableView
            
            switch(indexPath.section) {
            case 3:
                let title = "All Product"
                headerView.configure(with: title)
            case 4:
                let title = "All Services"
                headerView.configure(with: title)
            default:
                let title = ""
                headerView.configure(with: title)
            }
            
            return headerView
        }
        return UICollectionReusableView()
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.bounds.width, height: 150)
        case 1:
            return CGSize(width: collectionView.bounds.width, height: 150)
        case 2:
            return CGSize(width: collectionView.bounds.width, height: 125)
        case 3:
            return CGSize(width: 170, height: 210)
        case 4:
            return CGSize(width: 340, height: 150)
        default:
            return .zero
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        if section == 3 || section == 4 {
            return CGSize(width: 120, height: 40)
        }
        
        return .zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 15, left: 20, bottom: 15, right: 20)
    }
}
