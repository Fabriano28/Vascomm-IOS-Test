//
//  ClickableLabel.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 28/10/24.
//

import UIKit

class ClickableLabel: UILabel {

    var tapAction: (() -> Void)?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupGesture()
    }
    
    private func setupGesture() {
        isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
        addGestureRecognizer(tapGesture)
    }
    
    @objc func labelTapped() {
        tapAction?()
    }

}
