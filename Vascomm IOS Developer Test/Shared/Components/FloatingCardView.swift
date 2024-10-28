//
//  FloatingCardView.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

class FloatingCardView: UIView {
    
    private var contentView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        view.layer.cornerRadius = 12
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.2
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowRadius = 8
        
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCardAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCardAppearance()
    }
    
    private func setupCardAppearance() {
        self.backgroundColor = .clear
        
        addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: self.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
        ])
    }
    
    func setContent(_ view: UIView) {
        contentView.subviews.forEach { $0.removeFromSuperview() }
        
        contentView.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
    }

}
