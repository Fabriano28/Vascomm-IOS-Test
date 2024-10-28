//
//  ProductCollectionViewCell.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    
    private let productContainer = FloatingCardView()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let productLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = UIColor(hex: "#002060")
        return label
    }()
    
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.lineBreakMode = .byClipping
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: "#FF7200")
        return label
    }()
    
    private let stockView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#B3FFCB")
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let stockLabel: UILabel = {
        let label = UILabel()
        label.text = "Ready Stock"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = UIColor(hex: "#007025")
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [priceLabel])
        stackView.axis = .horizontal
        stackView.spacing = 1
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
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
        self.addSubview(productContainer)
        
        productContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            productContainer.topAnchor.constraint(equalTo: topAnchor),
            productContainer.bottomAnchor.constraint(equalTo: bottomAnchor),
            productContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            productContainer.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
        
        productContainer.addSubview(imageView)
        productContainer.addSubview(productLabel)
        stockView.addSubview(stockLabel)
        
        stockView.translatesAutoresizingMaskIntoConstraints = false
        stockLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stockLabel.centerXAnchor.constraint(equalTo: stockView.centerXAnchor),
            stockLabel.centerYAnchor.constraint(equalTo: stockView.centerYAnchor),
            stockLabel.widthAnchor.constraint(equalTo: stockView.widthAnchor, multiplier: 0.9)
        ])
        
        productContainer.addSubview(labelStackView)
        labelStackView.addArrangedSubview(stockView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        productLabel.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 25),
            imageView.leadingAnchor.constraint(equalTo: productContainer.leadingAnchor, constant: 40),
            imageView.trailingAnchor.constraint(equalTo: productContainer.trailingAnchor, constant: -40),
            
            productLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            productLabel.leadingAnchor.constraint(equalTo: productContainer.leadingAnchor, constant: 16),
            productLabel.trailingAnchor.constraint(equalTo: productContainer.trailingAnchor, constant: -16),
            
            labelStackView.topAnchor.constraint(equalTo: productLabel.bottomAnchor, constant: 8),
            labelStackView.leadingAnchor.constraint(equalTo: productContainer.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: productContainer.trailingAnchor, constant: -16),
            labelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
    
    func configure(with product: Product) {
        imageView.image = UIImage(named: product.productImage)
        productLabel.text = product.productName
        priceLabel.text = "Rp. \(product.productPrice)"
    }
}
