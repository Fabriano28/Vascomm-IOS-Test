//
//  ServiceCollectionViewCell.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import UIKit

class ServiceCollectionViewCell: UICollectionViewCell {
    
    private let serviceContainer = FloatingCardView()
    
    private let serviceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let serviceTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .preferredFont(forTextStyle: .headline)
        label.textColor = UIColor(hex: "#002060")
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.font = UIFont.systemFont(ofSize: 14)
        return label
    }()
    
    private let servicePriceLabel: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#FF7200")
        
        return label
    }()
    
    private let serviceLocationNameLabel: UILabel = {
        let label = UILabel()
        
        label.font = .preferredFont(forTextStyle: .caption1)
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(hex: "#6A6A6A")
        
        return label
    }()
    
    private let serviceLocationAddressLabel: UILabel = {
        let label = UILabel()
        
        label.font = .preferredFont(forTextStyle: .caption2)
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: "#BEBEBE")

        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [serviceTitleLabel, servicePriceLabel, serviceLocationNameLabel, serviceLocationAddressLabel])
        stackView.axis = .vertical
        stackView.spacing = 5
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [labelStackView, serviceImageView])
        stackView.axis = .horizontal
        stackView.spacing = 10
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupViews() {
        self.addSubview(serviceContainer)
        serviceContainer.translatesAutoresizingMaskIntoConstraints = false
        
        serviceContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            serviceContainer.topAnchor.constraint(equalTo: topAnchor),
            serviceContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            serviceContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            serviceContainer.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            serviceImageView.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    func configure(with service: Service) {
        serviceImageView.image = UIImage(named: service.serviceImage)
        serviceTitleLabel.text = service.serviceName
        servicePriceLabel.text = "Rp. \(service.servicePrice)"
        serviceLocationNameLabel.text = service.serviceLocationName
        serviceLocationAddressLabel.text = service.serviceLocationAddress
    }
}
