//
//  ProductHeaderReusableView.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import UIKit

class SectionHeaderReusableView: UICollectionReusableView {
    static let reuseIdentifier = "SectionHeader"
    
    private let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#002060")
        return view
    }()
    
    private let headerLabel: UILabel = {
        let label = UILabel()
        let font = UIFont.preferredFont(forTextStyle: .headline)
        label.font = font
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        addSubview(headerView)
        headerView.addSubview(headerLabel)
        
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        headerView.layer.cornerRadius = 20
        
        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: topAnchor),
            headerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            headerLabel.centerXAnchor.constraint(equalTo: headerView.centerXAnchor),
            headerLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
            
    }
    
    func configure(with title: String){
        headerLabel.text = title
    }
    
}
