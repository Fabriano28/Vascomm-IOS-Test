//
//  InputStackView.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

class InputStackView: UIStackView {

    private let label: UILabel = {
        let label = UILabel()
        
        label.text = "Username"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(hex: "#002060")
        
        return label
    }()
    
    private let textField: UITextField = {
        let textField = UITextField()
        
        textField.placeholder = "Masukkan email anda"
        textField.borderStyle = .roundedRect
        textField.autocapitalizationType = .none
        
        return textField
    }()
    
    init(labelText: String, placeholder: String) {
        super.init(frame: .zero)
        label.text = labelText
        textField.placeholder = placeholder
        
        axis = .vertical
        spacing = 10
        alignment = .fill
        distribution = .fill
        
        addArrangedSubview(label)
        addArrangedSubview(textField)
    }
    
    required init(coder: NSCoder) {
        fatalError()
    }
}
