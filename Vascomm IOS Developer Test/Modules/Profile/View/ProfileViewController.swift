//
//  ProfileViewController.swift
//  Vascomm IOS Developer Test
//
//  Created by Farrel Brian on 27/10/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()
    
    private let menuSwitchImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menuSwitch")
        return imageView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profileImage")
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Farrel Brian"
        label.textColor = UIColor(hex: "#002060")
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let membershipLabel: UILabel = {
        let label = UILabel()
        label.text = "Membership BBLK"
        label.textColor = .lightGray
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        return label
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, membershipLabel])
        stackView.axis = .vertical
        stackView.spacing = 1
        return stackView
    }()
    
    private lazy var profileDataStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [profileImageView, labelStackView])
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()
    
    private let footerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(hex: "#002060")
        return view
    }()
    
    private let footerLabel: UILabel = {
        let label = UILabel()
        label.text = "Ingin mendapat update dari kami ?"
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let formContainer = FloatingCardView()
    
    private lazy var firstNameInput: InputStackView = {
        return InputStackView(labelText: "Nama Depan", placeholder: "Masukkan nama depan")
    }()
    
    private lazy var lastNameInput: InputStackView = {
        return InputStackView(labelText: "Nama Belakang", placeholder: "Masukkan nama belakang")
    }()
    
    private lazy var emailInput: InputStackView = {
        return InputStackView(labelText: "Email", placeholder: "Masukkan email")
    }()
    
    private lazy var phoneInput: InputStackView = {
        return InputStackView(labelText: "No Telpon", placeholder: "Masukkan No. Telpon")
    }()
    
    private lazy var idCardInput: InputStackView = {
        return InputStackView(labelText: "No KTP", placeholder: "Masukkan No. KTP")
    }()
    
    private let warningLogo: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileWarning"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "Pastikan profile anda terisi dengan benar, data pribadi anda terjamin keamanannya"
        label.font = .systemFont(ofSize: 12)
        label.textColor = UIColor(hex: "#6A6A6A")
        
        return label
    }()
    
    private let saveButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Simpan Profile", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#002060")
        button.layer.cornerRadius = 8
        button.clipsToBounds = true
        
        return button
    }()
    
    private lazy var profileStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [firstNameInput, lastNameInput, emailInput, phoneInput, idCardInput, warningLabel, saveButton])
        
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
        // Scroll View
        view.addSubview(profileScrollView)
        profileScrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileScrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Menu Switch (image)
        profileScrollView.addSubview(menuSwitchImageView)
        menuSwitchImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            menuSwitchImageView.topAnchor.constraint(equalTo: profileScrollView.topAnchor, constant:  40),
            menuSwitchImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 55),
            menuSwitchImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -55),
            menuSwitchImageView.heightAnchor.constraint(equalTo: menuSwitchImageView.widthAnchor, multiplier: 0.17)
        ])
        
        // Profile Data / Info
        profileScrollView.addSubview(profileDataStackView)
        profileDataStackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileDataStackView.topAnchor.constraint(equalTo: menuSwitchImageView.bottomAnchor, constant: 40),
            profileDataStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        // Form Card Container
        profileScrollView.addSubview(formContainer)
        formContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            formContainer.topAnchor.constraint(equalTo: profileDataStackView.bottomAnchor, constant: 40),
            formContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            formContainer.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32)
        ])
        
        profileStackView.translatesAutoresizingMaskIntoConstraints = false
        
        formContainer.setContent(profileStackView)
        
        // Footer
        profileScrollView.addSubview(footerView)
        footerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerView.topAnchor.constraint(equalTo: formContainer.bottomAnchor, constant: 40),
            footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            footerView.bottomAnchor.constraint(equalTo: profileScrollView.bottomAnchor)
        ])
        
        footerView.addSubview(footerLabel)
        footerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            footerLabel.topAnchor.constraint(equalTo: footerView.topAnchor, constant: 30),
            footerLabel.bottomAnchor.constraint(equalTo: footerView.bottomAnchor, constant: -30),
            footerLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

}
